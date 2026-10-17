//
//  SpeechRecordingModel.swift
//  3AMGenius
//
//  Created by Thomas Trompeter on 10/8/26.
//

import AVFoundation
import Speech
import SwiftUI

@Observable
class SpeechRecordingModel {
    enum Status {
        case preparing, ready, starting, recording, stopping
        
        var buttonTitle: String {
            switch self {
            case .preparing: "Preparing"
            case .ready: "Start Recording"
            case .starting: "Starting"
            case .recording: "Stop Recording"
            case .stopping: "Stopping"
            }
        }
        
        var buttonSystemImage: String {
            switch self {
            case .recording, .stopping: "stop.fill"
            default: "record.circle"
            }
        }
        
        var canToggleRecording: Bool {
            self == .ready || self == .recording
        }
    }
    
    var transcript: AttributedString = ""
    var status = Status.preparing
    var errorMessage = ""
    var isShowingError = false
    var recordingTask: Task<Void, Never>?
    var isPrepared = false
    
    var displayedTranscript: AttributedString {
        if transcript.characters.isEmpty {
            "I'm listening ..."
        } else {
            transcript
        }
    }
    
    func showError(_ message: String) {
        errorMessage = message
        isShowingError = true
    }
    
    func makeTranscriber() async throws -> DictationTranscriber {
        guard let locale = await DictationTranscriber.supportedLocale(equivalentTo: .current) else {
            throw SpeechError("Sorry, your language isn't supported")
        }
        let preset = DictationTranscriber.Preset.progressiveShortDictation
        
        return DictationTranscriber(locale: locale, contentHints: preset.contentHints, transcriptionOptions: preset.transcriptionOptions, reportingOptions: preset.reportingOptions, attributeOptions: preset.attributeOptions)
    }
    
    func installSpeechAssets() async throws {
        let transcriber = try await makeTranscriber()
        if let request = try await AssetInventory.assetInstallationRequest(supporting: [transcriber]) {
            try await request.downloadAndInstall()
        }
    }
    
    func prepare() async {
        guard isPrepared == false else { return }
        isPrepared = true
        do {
           try await installSpeechAssets()
            guard await AVCaptureDevice.requestAccess(for: .audio) else {
                throw SpeechError("Microphone permission was not granted.")
            }
            status = .ready
        } catch {
            showError(error.localizedDescription)
        }
    }
    
    @concurrent
    func makeSession() async throws -> (
        provider: CaptureInputSequenceProvider,
        analyzer: SpeechAnalyzer,
        transcriber: DictationTranscriber
    ) {
        guard let captureDevice = AVCaptureDevice.default(
            .microphone,
            for: .audio,
            position: .unspecified
        ) else {
            throw SpeechError("Could not capture the microphone for voice recording.")
        }
        let transcriber = try await makeTranscriber()
        let analyzer = SpeechAnalyzer(modules: [transcriber])
        let provider = try await CaptureInputSequenceProvider.providerWithSession(from: captureDevice, compatibleWith: [transcriber])
        return (provider, analyzer, transcriber)
    }
    
    func startRecording() async {
        status = .starting
        do {
            let (provider, analyzer, transcriber) = try await makeSession()
            let session = CaptureSession(provider)
            transcript = ""
            status = .recording
            recordingTask = Task {
                await runSession(session: session, analyzer: analyzer, transcriber: transcriber)
                recordingTask = nil
                status = .ready
            }
        } catch {
            status = .ready
            showError(error.localizedDescription)
        }
    }
    
    func runSession(session: CaptureSession, analyzer: SpeechAnalyzer, transcriber: DictationTranscriber) async {
        let results = transcriber.results
        do {
            try await withThrowingDiscardingTaskGroup { group in
                group.addTask {
                    try await session.run(analyzer: analyzer)
                }
                group.addTask {
                    try await withTaskCancellationShield {
                        for try await result in results {
                            await self.apply(result)
                        }
                    }
                }
            }
        } catch {
            if error is CancellationError == false {
                showError(error.localizedDescription)
            }
        }
    }
    
    func apply(_ result: DictationTranscriber.Result) {
        var resultText = result.text
        resultText.audioTimeRange = result.range
        resultText.foregroundColor = result.isFinal ? .primary : .secondary
        if let range = transcript.rangeOfAudioTimeRangeAttributes(intersecting: result.range) {
            transcript.replaceSubrange(range, with: resultText)
        } else {
            transcript.append(resultText)
        }
    }
    
    func toggleRecording() async -> String? {
        if status == .recording {
            status = .stopping
            let task = recordingTask
            task?.cancel()
            await task?.value
            let transcription = String(transcript.characters).trimmingCharacters(in: .whitespacesAndNewlines)
            return transcription.isEmpty ? nil : transcription
        } else if status == .ready {
            await startRecording()
        }
        
        return nil
    }
}

struct SpeechError: LocalizedError {
    let errorDescription: String?
    
    init(_ message: String) {
        errorDescription = message
    }
}

actor CaptureSession {
    let provider: CaptureInputSequenceProvider
    
    init(_ provider: sending CaptureInputSequenceProvider) {
        self.provider = provider
    }
    
    func run(analyzer: SpeechAnalyzer) async throws {
        let session = provider.captureSession
        session.startRunning()
        defer { session.stopRunning() }
        let lastAudioTime = try await analyzer.analyzeSequence(provider.analyzerInputs)
        if let lastAudioTime {
            try await analyzer.finalizeAndFinish(through: lastAudioTime)
        }
    }
}

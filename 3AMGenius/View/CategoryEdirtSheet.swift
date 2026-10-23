//
//  CategorySheetView.swift
//  3amGenius
//
//  Created by Thomas Trompeter on 10/15/26.
//

import SwiftData
import SwiftUI

struct CategorySheet: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Binding var brainstorm: Brainstorm?
    @State private var errorMessage: String?
    @State private var showErrorAlert = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Set The")
                    .font(.title)
                Text("Brainstorm Category")
                    .font(.title)
                Text("Select a category for your Brainstorm")
                    .padding(.bottom, 10)
                Button("Coding") {
                    brainstorm!.category = .coding
                    do {
                        try modelContext.save()
                    } catch {
                        errorMessage = error.localizedDescription
                        showErrorAlert = true
                    }
                    dismiss()
                }
                .buttonStyle(FunctionsButtonStyle())
                Button("Financial") {
                    brainstorm!.category = .financial
                    do {
                        try modelContext.save()
                    } catch {
                        errorMessage = error.localizedDescription
                        showErrorAlert = true
                    }
                    dismiss()
                }
                .buttonStyle(FunctionsButtonStyle())
                Button("Legal") {
                    brainstorm!.category = .legal
                    do {
                        try modelContext.save()
                    } catch {
                        errorMessage = error.localizedDescription
                        showErrorAlert = true
                    }
                    dismiss()
                }
                .buttonStyle(FunctionsButtonStyle())
                Button("Misc") {
                    brainstorm!.category = .misc
                    do {
                        try modelContext.save()
                    } catch {
                        errorMessage = error.localizedDescription
                        showErrorAlert = true
                    }
                    dismiss()
                }
                .buttonStyle(FunctionsButtonStyle())
                Button("OCA") {
                    brainstorm!.category = .oca
                    do {
                        try modelContext.save()
                    } catch {
                        errorMessage = error.localizedDescription
                        showErrorAlert = true
                    }
                    dismiss()
                }
                .buttonStyle(FunctionsButtonStyle())
                Button("Personal") {
                    brainstorm!.category = .personal
                    do {
                        try modelContext.save()
                    } catch {
                        errorMessage = error.localizedDescription
                        showErrorAlert = true
                    }
                    dismiss()
                }
                .buttonStyle(FunctionsButtonStyle())
            }
            .padding()
            .presentationBackground(Color.background.opacity(0.3))
            .font(.headline)
            .foregroundStyle(.tertiarytext)
            .alert("Error Saving Brainstorm Category", isPresented: $showErrorAlert, presenting: errorMessage) { _ in
                Button("OK", role: .cancel) {}
            } message: { message in
                Text(message)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
}

//#Preview {
//    CategorySheetView(brainstorm: .constant(nil))
//}

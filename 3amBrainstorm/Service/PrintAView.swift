//
//  PrintView.swift
//  3amBrainstorm
//
//  Created by Thomas Trompeter on 11/8/26.
//

import SwiftUI

@MainActor
func printView<V: View>(view: V, jobName: String = "Print Job") {
    // 1. Setup the directory and file URL for a temporary PDF
    let tempDirectory = FileManager.default.temporaryDirectory
    let pdfURL = tempDirectory.appendingPathComponent("\(UUID().uuidString).pdf")
    
    // 2. Render the SwiftUI view as a PDF document
    let renderer = ImageRenderer(content: view)
    
    renderer.render { size, context in
        var box = CGRect(origin: .zero, size: size)
        
        // Create a Core Graphics PDF context
        guard let pdfContext = CGContext(pdfURL as CFURL, mediaBox: &box, nil) else { return }
        
        // Start the PDF page, render the view, and close the context
        pdfContext.beginPDFPage(nil)
        context(pdfContext)
        pdfContext.endPDFPage()
        pdfContext.closePDF()
    }
    
    // 3. Present the native Apple iOS Print Sheet
    let printInfo = UIPrintInfo(dictionary: nil)
    printInfo.jobName = jobName
    printInfo.outputType = .general
    
    let printController = UIPrintInteractionController.shared
    printController.printInfo = printInfo
    printController.printingItem = pdfURL // Pass the generated PDF file URL
    
    // Present the sheet on screen
    printController.present(animated: true) { _, completed, error in
        if let error = error {
            print("Printing error: \(error.localizedDescription)")
        }
        // Optional: Clean up and delete the temporary file after printing
        try? FileManager.default.removeItem(at: pdfURL)
    }
}

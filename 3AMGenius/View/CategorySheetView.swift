//
//  CategorySheetView.swift
//  3AMGenius
//
//  Created by Thomas Trompeter on 10/15/26.
//

import SwiftData
import SwiftUI

struct CategorySheetView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var brainstorm: Brainstorm?
    
    var body: some View {
        VStack {
            Text("Category Sheet")
                .font(.title)
            Text("Select a category for your Brainstorm")
            Button("Coding") {
                
            }
            .buttonStyle(FunctionsButtonStyle())
            Button("Financial") {
                
            }
            .buttonStyle(FunctionsButtonStyle())
            Button("Legal") {
                
            }
            .buttonStyle(FunctionsButtonStyle())
            Button("Misc") {
                
            }
            .buttonStyle(FunctionsButtonStyle())
            Button("OCA") {
                
            }
            .buttonStyle(FunctionsButtonStyle())
            Button("Personal") {
                
            }
            .buttonStyle(FunctionsButtonStyle())
        }
    }
}

#Preview {
    CategorySheetView(brainstorm: .constant(nil))
}

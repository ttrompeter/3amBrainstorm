//
//  HelpInfoSheet.swift
//  3amBrainstorm
//
//  Created by Thomas Trompeter on 11/10/26.
//

import SwiftUI

struct HelpInfoSheet: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Brainstorm Help")
                    .font(.title)
                Text("Information Sheet")
                    .padding(.bottom, 10)
                    .font(.title)
                VStack (alignment: .leading, spacing: 10) {
                    Text("Providing information to help you use the 3amBrainstorm App to the fullest.")
                }
            }
            .padding()
            .presentationBackground(Color.background.opacity(0.3))
            .font(.headline)
            .foregroundStyle(.tertiarytext)
            .toolbar {
                ToolbarItem (placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

#Preview {
    HelpInfoSheet()
}

//
//  ArchivedBrainstomEditSheet.swift
//  3amBrainstorm
//
//  Created by Thomas Trompeter on 11/13/26.
//

import SwiftData
import SwiftUI

struct z_ArchivedBrainstormEditSheet: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    let archivedBrainstorm: ArchivedBrainstorm
    @State private var tempBrainstormText = ""
    @State private var errorMessage: String?

    var body: some View {
        NavigationStack {
            VStack {
                Text("Edit Your Brainstorm")
                    .font(.title)
                Text("Click on Text Editor area to edit your Brainstorm (and show keyboard)")
                    .font(.callout)
                let textBinding: Binding<String> = Binding<String>(
                    get: { archivedBrainstorm.brainstormText },
                    set: { newValue in
                        archivedBrainstorm.brainstormText = newValue
                        tempBrainstormText = newValue
                    }
                )
                TextEditor(text: textBinding)
                    .font(.title2)
                    .lineSpacing(3)
                    .padding()
                    .scrollContentBackground(.hidden)
                    .background(Color.tertiarytext)
                    .foregroundStyle(.primarytext)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    // 4. Add an optional clean stroke outline
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
            }
            .padding()
            .presentationBackground(Color.background.opacity(0.3))
            .font(.headline)
            // .foregroundStyle(.tertiarytext)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(role: .cancel) {
                        dismiss()
                    }
                    Button {
                        do {
                            archivedBrainstorm.brainstormText = tempBrainstormText
                            try modelContext.save()
                        } catch {
                            errorMessage = error.localizedDescription
                        }
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
    }
}

//#Preview {
//    ArchivedBrainstomEditSheet()
//}

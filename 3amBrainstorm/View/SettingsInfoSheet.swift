//
//  SettingsInformationSheet.swift
//  3amBrainstorm
//
//  Created by Thomas Trompeter on 11/9/26.
//

import SwiftUI

struct SettingsInformationSheet: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Settings")
                        .font(.title)
                    Text("Information Sheet")
                        .padding(.bottom, 10)
                        .font(.title)
                    VStack (alignment: .leading, spacing: 10) {
                        Text("There are many actions you can take to manage the app. You can .")
                        HStack (alignment: .top) {
                            Text("•")
                            Text("Delete a Category.")
                        }
                        HStack (alignment: .top) {
                            Text("•")
                            Text("Add a new Category.")
                        }
                        
                        Text("At the top you can tap on the name of the area grouping - Priority • Date • Category - that you want to see.")
                        Text("Each Brainstorm's summary is shown in a green rounded rectangle. In the Priority area grouping the category is shown to the left of the summary and the date is shown as the end of the summary. In the Date area grouping the category and priority are shown to the left of the summary. In the Category area grouping the priority is shown to the left of the summary and the date is shown as the end of the summary")
                        Text("To see the details of a Brainstorm tap on it and it will show the full information of that Brainstorm.")
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
}

#Preview {
    SettingsInformationSheet()
}

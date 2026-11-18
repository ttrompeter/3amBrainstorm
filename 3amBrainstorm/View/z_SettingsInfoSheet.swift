//
//  SettingsInformationSheet.swift
//  3amBrainstorm
//
//  Created by Thomas Trompeter on 11/9/26.
//

import SwiftUI

struct z_SettingsInformationSheet: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("3amBrainstorm Settings")
                        .font(.title)
                    Text("Information Sheet")
                        .padding(.bottom, 10)
                        .font(.title)
                    VStack (alignment: .leading, spacing: 10) {
                        Text("There are many actions you can take to manage the app. You can:")
                        HStack (alignment: .top) {
                            Text("•")
                            Text("Set the Default Priority.")
                        }
                        HStack (alignment: .top) {
                            Text("•")
                            Text("Set the Default Category.")
                        }
                        HStack (alignment: .top) {
                            Text("•")
                            Text("Set the Archive Months.")
                        }
                        HStack (alignment: .top) {
                            Text("•")
                            Text("Set the Deletion Months.")
                        }
                        Text("In each section there is an information button (\(Image(systemName: "info.circle.fill"))) that explains how to adjust the setting or take other available actions. Click on the appropriate (\(Image(systemName: "info.circle.fill"))) to see the detailed information.")
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
    z_SettingsInformationSheet()
}

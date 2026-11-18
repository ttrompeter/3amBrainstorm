//
//  ArchivedBrainstormRowView.swift
//  3amBrainstorm
//
//  Created by Thomas Trompeter on 11/11/26.
//

import SwiftData
import SwiftUI

struct z_ArchivedBrainstormRowViewArchivedBrainstormRowView: View {
    let archivedBrainstorm: ArchivedBrainstorm
    
    var body: some View {
        VStack {
            Text("Archived Brainstorm")
                .font(.caption)
                .foregroundStyle(Color.umpuke)
            HStack {
                VStack {
                    Image(systemName: archivedBrainstorm.category.systemImage)
                        .padding(.bottom, 8)
                        .font(.system(size: 26))
                        .foregroundStyle(archivedBrainstorm.category.color)
                    Image(systemName: archivedBrainstorm.priority.systemImage)
                        .font(.system(size: 26))
                        .foregroundStyle(archivedBrainstorm.priority.color)
                }
                VStack(alignment: .leading) {
                    Text(archivedBrainstorm.summary.isEmpty ? archivedBrainstorm.brainstormText : archivedBrainstorm.summary)
                        .font(.title3)
                        .foregroundStyle(.primarytext)
                        .lineLimit(3)
                    
                    Text("Date Created: \(archivedBrainstorm.date, format: .dateTime.day().month().year())")
                        .foregroundStyle(.secondarytext)
                    Text("Date Archived: \(archivedBrainstorm.date, format: .dateTime.day().month().year())")
                        .foregroundStyle(.secondarytext)
                }
            }
        }
    }
}

//#Preview {
//    ArchivedBrainstormRowView()
//}

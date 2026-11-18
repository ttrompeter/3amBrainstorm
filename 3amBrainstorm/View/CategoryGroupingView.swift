//
//  CategoryGroupSectionView.swift
//  3amBrainstorm
//
//  Created by Thomas Trompeter on 11/18/26.
//

import SwiftData
import SwiftUI

struct CategoryGroupingView: View {
    @Environment(BrainstormsManager.self) private var brainstormsManager
    @State private var searchText = ""
    @State private var help:HelpType?
    
    // Extracted predicates and sort descriptors to avoid type-checker timeouts
    private static let unarchivedPredicate: Predicate<Brainstorm> = #Predicate { brainstorm in
        !brainstorm.isArchived
    }
    private static let sortByCategoryThenDate: [SortDescriptor<Brainstorm>] = [
        SortDescriptor(\Brainstorm.categoryRaw),
        SortDescriptor(\Brainstorm.date, order: .reverse)
    ]
    @Query(filter: unarchivedPredicate, sort: sortByCategoryThenDate) private var unarchivedBrainstormsByCategory: [Brainstorm]
    
    var body: some View {
        //List(selection: $selectedBrainstorm) {
        List {
            let dict = groupedByCategory(searchText)
            ForEach(dict.keys.sorted { $0.rawValue < $1.rawValue }, id: \.self) { category in
                if let categoryBrainstorms = dict[category] {
                    Section {
                        ForEach(categoryBrainstorms) { brainstorm in
                            NavigationLink(value: brainstorm) {
                                HStack {
                                    VStack {
                                        Image(systemName: brainstorm.priority.systemImage)
                                            .font(.system(size: 26))
                                            .foregroundStyle(brainstorm.priority.color)
                                    }
                                    VStack(alignment: .leading) {
                                        Text(brainstorm.summary.isEmpty ? brainstorm.brainstormText : brainstorm.summary)
                                            .font(.title3)
                                            .foregroundStyle(.primarytext)
                                            .lineLimit(3)
                                        
                                        Text(brainstorm.date, format: .dateTime.day().month().year())
                                            .foregroundStyle(.secondarytext)
                                    }
                                }
                            }
                            .listRowBackground(Color.listbackground)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                        )
                    } header: {
                        LabeledContent {
                            HStack(spacing: 0) {
                                Spacer()
                                Text(category.rawValue)
                                    .font(.title.bold())
                                    .foregroundStyle(.primary)
                                Spacer()
                            }
                        } label: {
                            Image(systemName: category.systemImage)
                                .foregroundStyle(.white)
                                .padding(3)
                                .background(
                                    Circle()
                                        .fill(.umorange)
                                )
                        }
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .frame(maxWidth: .infinity)
                        .font(.title2.bold())
                        .listRowBackground(Color.listbackground)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.umorange, lineWidth: 2)
                        }
                    }
                    .listRowBackground(Color.listbackground)
                }
            }
            .listRowBackground(Color.listbackground)
        }
        .scrollContentBackground(.hidden)
        .listRowSpacing(5)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Brainstorms")
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Grouped Brainstorms")
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .foregroundStyle(.navtitle)
            }
        }
        .helpButton(currentHelp: .grouped, help: $help)
    }
    
    func groupedByCategory(_ filterString: String) -> [BrainstormCategory: [Brainstorm]] {
        let filteredItems = brainstormsManager.brainstormsFilteredBy(filterString, brainstormsToFilter: unarchivedBrainstormsByCategory)
        return Dictionary(grouping: filteredItems, by: \.category)
    }
}

//#Preview {
//    CategoryGroupSectionView()
//}

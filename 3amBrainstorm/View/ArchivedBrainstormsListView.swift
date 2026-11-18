//
//  ArchivedListView.swift
//  3amBrainstorm
//
//  Created by Thomas Trompeter on 11/11/26.
//

import SwiftData
import SwiftUI

struct ArchivedBrainstormsListView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(BrainstormsManager.self) private var brainstormsManager
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \ArchivedBrainstorm.date, order: .reverse) private var archivedBrainstorms: [ArchivedBrainstorm]
    @State private var selectedArchivedBrainstorm: ArchivedBrainstorm?
    @State private var searchText = ""
    @State private var showUnarchiveAlert = false

    var filteredArchivedBrainstorms: [ArchivedBrainstorm] {
        if searchText.isEmpty == false {
            archivedBrainstorms.filter {
                $0.brainstormText.localizedStandardContains(searchText)
                    || $0.summary.localizedStandardContains(searchText)
                    || $0.keywords.localizedStandardContains(searchText)
            }
        } else {
            archivedBrainstorms
        }
    }

    var body: some View {
        NavigationSplitView {
            VStack {
                if horizontalSizeClass == .regular && verticalSizeClass == .regular {
                    // Typically an iPad in any orientation, or large window space on iPhone, has regular size class in both orientations
                    Text("Archived 3am Brainstorms")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundStyle(.navtitle)
                }
                List(filteredArchivedBrainstorms, selection: $selectedArchivedBrainstorm) { archivedBrainstorm in
                    NavigationLink(value: archivedBrainstorm) {
                        ArchivedBrainstormRowView(archivedBrainstorm: archivedBrainstorm)
                            .tag(archivedBrainstorm)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button("Delete", systemImage: "trash", role: .destructive) {
                                    // store.delete(recipe)
                                    print("Delete ArchivedBrainstorm in ArchivedListView")
                                }
                                Button("Unarchive", systemImage: "arrow.up.bin") {
                                    // store.delete(recipe)
                                    showUnarchiveAlert = true
                                }
                            }
                    }
                    .listRowBackground(RoundedRectangle(cornerRadius: 20).fill(Color.listbackground))
                }
                .scrollContentBackground(.hidden)
                .navigationDestination(for: ArchivedBrainstorm.self) { anArchivedBrainstorm in
                    ArchivedBrainstormDetailView(archivedBrainstorm: anArchivedBrainstorm)
                }
                .listRowSpacing(5)
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Brainstorms")
                .toolbar {
                    if horizontalSizeClass != .regular {
                        ToolbarItem(placement: .principal) {
                            Text("Archived Brainstorms")
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundStyle(.navtitle)
                        }
                    }
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button {
                            // isShowingListInformationSheet = true
                        } label: {
                            Image(systemName: "info.circle.fill")
                        }
                        Button {
                            // isShowingBrainstormOverviewSheet = true
                        } label: {
                            Image(systemName: "questionmark")
                        }
                    }
                }
                .overlay {
                    if filteredArchivedBrainstorms.isEmpty && searchText.isEmpty {
                        ContentUnavailableView("No Archived Brainstorms", systemImage: "circle", description: Text("There are no Archived Brainstorms"))
                    } else if filteredArchivedBrainstorms.isEmpty && !searchText.isEmpty {
                        ContentUnavailableView.search
                    }
                }
                .searchable(text: $searchText)
                VStack {
                    // Create spacing to force Manage Categories above tab bar
                    Text(" ")
                }
                .padding(.bottom, 20)
            }
            .background(.background.opacity(0.2))
        } detail: {
            VStack {
                Text("Detail")
            }
        }
    }
}

#Preview {
    ArchivedBrainstormsListView()
}

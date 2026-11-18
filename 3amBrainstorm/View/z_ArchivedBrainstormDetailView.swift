//
//  ArchivedBrainstormDetailView.swift
//  3amBrainstorm
//
//  Created by Thomas Trompeter on 11/11/26.
//

import SwiftData
import SwiftUI

struct z_ArchivedBrainstormDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(BrainstormsManager.self) private var brainstormsManager
    let archivedBrainstorm: ArchivedBrainstorm
    @State private var recorder = SpeechRecordingModel()
    @State private var isEditing = false
    @State private var showUnarchiveAlert = false
    @State private var showCategoryEditSheet = false
    @State private var showDeleteAlert = false
    @State private var showArchivedBrainstormEditSheet = false
    @State private var showPriorityEditSheet = false
    @State private var errorMessage = ""

    var body: some View {
        ScrollView {
//            VStack(alignment: .leading) {
//                VStack {
//                    if archivedBrainstorm.summary.isEmpty == false {
//                        Text("Archived Brainstorm")
//                            .font(.caption)
//                            .foregroundStyle(Color.umpuke)
//                        Text("Summary of your Brainstorm")
//                            .font(.title2.bold())
//                            .foregroundStyle(.primarytext)
//                            .padding(.bottom, 8)
//                        Divider()
//                            .frame(width: 200, height: 1)
//                            .background(Color.borders)
//                        Text(archivedBrainstorm.summary)
//                            .font(.title2)
//                            .foregroundStyle(.primarytext)
//                    } else {
//                        Text("There is no Summary for your Brainstorm.")
//                            .font(.title2)
//                            .foregroundStyle(.umorange)
//                    }
//                }
//                .padding()
//                .frame(maxWidth: .infinity)
//                .background(
//                    RoundedRectangle(cornerRadius: 20, style: .continuous)
//                        .foregroundStyle(.listbackground)
//                )
//                Divider()
//                    .frame(height: 2)
//                    .background(Color.borders)
//                    .padding(.vertical, 8)
//                VStack {
//                    Text("Archived Brainstorm")
//                        .font(.caption)
//                        .foregroundStyle(Color.umpuke)
//                    Text("Your Full Brainstorm")
//                        .font(.title2.bold())
//                        .foregroundStyle(.primarytext)
//                    Divider()
//                        .frame(width: 200, height: 1)
//                        .background(Color.borders)
//                    VStack(alignment: .leading, spacing: 10) {
//                        HStack (alignment: .center, spacing: 10) {
//                            Image(systemName: archivedBrainstorm.category.systemImage)
//                                .font(.system(size: 26))
//                                .padding(.bottom, 5)
//                                .foregroundStyle(archivedBrainstorm.category.color)
//                            Text("Category: \(archivedBrainstorm.category.rawValue)")
//                                .padding(.bottom, 5)
//                                .foregroundStyle(.primarytext)
//                            Spacer()
//                            Button {
//                                showCategoryEditSheet = true
//                            } label: {
//                                Image(systemName: "square.and.pencil")
//                                    .font(.system(size: 26))
//                                    .foregroundStyle(.primarytext)
//                            }
//                        }
//                        HStack (alignment: .center, spacing: 10) {
//                            Image(systemName: archivedBrainstorm.priority.systemImage)
//                                .font(.system(size: 26))
//                                .foregroundStyle(archivedBrainstorm.priority.color)
//                            Text("Priority: \(archivedBrainstorm.priority.rawValue)")
//                                .foregroundStyle(.primarytext)
//                            Spacer()
//                            Button {
//                                showPriorityEditSheet = true
//                            } label: {
//                                Image(systemName: "square.and.pencil")
//                                    .font(.system(size: 26))
//                                    .foregroundStyle(.primarytext)
//                            }
//                        }
//                        HStack (alignment: .center, spacing: 10) {
//                            Image(systemName: "arrow.up.bin")
//                                .font(.system(size: 26))
//                                .foregroundStyle(archivedBrainstorm.priority.color)
//                            Text("Unarchive Brainstorm")
//                                .foregroundStyle(.primarytext)
//                            Spacer()
//                            Button {
//                                showUnarchiveAlert = true
//                            } label: {
//                                Image(systemName: "checkmark")
//                                    .font(.system(size: 26))
//                                    .foregroundStyle(.primarytext)
//                            }
//                        }
//                    }
//                    Text("Date Created: \(archivedBrainstorm.date, format: .dateTime.day().month().year())")
//                        .foregroundStyle(.secondarytext)
////                    Text("Date Archived: \(archivedBrainstorm.archivedDate, format: .dateTime.day().month().year())")
////                        .foregroundStyle(.secondarytext)
//                    
//                    Text(archivedBrainstorm.brainstormText)
//                        .font(.title3)
//                        .foregroundStyle(.primarytext)
//                }
//                .padding()
//                .background(
//                    RoundedRectangle(cornerRadius: 20, style: .continuous)
//                        .foregroundStyle(.listbackground)
//                )
//
//                if archivedBrainstorm.keywords.isEmpty == false {
//                    Divider()
//                        .frame(height: 2)
//                        .background(Color.borders)
//                        .padding(.vertical, 8)
//
//                    Text("Keywords in your Brainstorm:")
//                        .font(.title2.bold())
//                        .foregroundStyle(.tertiarytext)
////                    Text(archivedBrainstorm.keywords)
////                        .foregroundStyle(.tertiarytext)
//                } else {
//                    Text("There are no Keywords for your Brainstorm.")
//                        .font(.title3)
//                        .foregroundStyle(.umorange)
//                }
//                VStack {
//                    // Create spacing to force Manage Categories above tab bar
//                    Text(" ")
//                }
//                .padding(.bottom, 20)
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding()
//            .sheet(isPresented: $showCategoryEditSheet) {
////                CategoryEditSheet(brainstorm: brainstorm)
////                    .presentationDetents([.medium])
//            }
//            .sheet(isPresented: $showPriorityEditSheet) {
////                PriorityEditSheet(brainstorm: brainstorm)
////                    .presentationDetents([.medium])
//            }{
//                VStack(alignment: .leading) {
//                    VStack {
//                        if archivedBrainstorm.summary.isEmpty == false {
//                            Text("Archived Brainstorm")
//                                .font(.caption)
//                                .foregroundStyle(Color.umpuke)
//                            Text("Summary of your Brainstorm")
//                                .font(.title2.bold())
//                                .foregroundStyle(.primarytext)
//                                .padding(.bottom, 8)
//                            Divider()
//                                .frame(width: 200, height: 1)
//                                .background(Color.borders)
//                            Text(archivedBrainstorm.summary)
//                                .font(.title2)
//                                .foregroundStyle(.primarytext)
//                        } else {
//                            Text("There is no Summary for your Brainstorm.")
//                                .font(.title2)
//                                .foregroundStyle(.umorange)
//                        }
//                    }
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(
//                        RoundedRectangle(cornerRadius: 20, style: .continuous)
//                            .foregroundStyle(.listbackground)
//                    )
//                    Divider()
//                        .frame(height: 2)
//                        .background(Color.borders)
//                        .padding(.vertical, 8)
//                    VStack {
//                        Text("Archived Brainstorm")
//                            .font(.caption)
//                            .foregroundStyle(Color.umpuke)
//                        Text("Your Full Brainstorm")
//                            .font(.title2.bold())
//                            .foregroundStyle(.primarytext)
//                        Divider()
//                            .frame(width: 200, height: 1)
//                            .background(Color.borders)
//                        VStack(alignment: .leading, spacing: 10) {
//                            HStack (alignment: .center, spacing: 10) {
//                                Image(systemName: archivedBrainstorm.category.systemImage)
//                                    .font(.system(size: 26))
//                                    .padding(.bottom, 5)
//                                    .foregroundStyle(archivedBrainstorm.category.color)
//                                Text("Category: \(archivedBrainstorm.category.rawValue)")
//                                    .padding(.bottom, 5)
//                                    .foregroundStyle(.primarytext)
//                                Spacer()
//                                Button {
//                                    showCategoryEditSheet = true
//                                } label: {
//                                    Image(systemName: "square.and.pencil")
//                                        .font(.system(size: 26))
//                                        .foregroundStyle(.primarytext)
//                                }
//                            }
//                            HStack (alignment: .center, spacing: 10) {
//                                Image(systemName: archivedBrainstorm.priority.systemImage)
//                                    .font(.system(size: 26))
//                                    .foregroundStyle(archivedBrainstorm.priority.color)
//                                Text("Priority: \(archivedBrainstorm.priority.rawValue)")
//                                    .foregroundStyle(.primarytext)
//                                Spacer()
//                                Button {
//                                    showPriorityEditSheet = true
//                                } label: {
//                                    Image(systemName: "square.and.pencil")
//                                        .font(.system(size: 26))
//                                        .foregroundStyle(.primarytext)
//                                }
//                            }
//                            HStack (alignment: .center, spacing: 10) {
//                                Image(systemName: "arrow.up.bin")
//                                    .font(.system(size: 26))
//                                    .foregroundStyle(archivedBrainstorm.priority.color)
//                                Text("Unarchive Brainstorm")
//                                    .foregroundStyle(.primarytext)
//                                Spacer()
//                                Button {
//                                    showUnarchiveAlert = true
//                                } label: {
//                                    Image(systemName: "checkmark")
//                                        .font(.system(size: 26))
//                                        .foregroundStyle(.primarytext)
//                                }
//                            }
//                        }
//                        Text("Date Created: \(archivedBrainstorm.date, format: .dateTime.day().month().year())")
//                            .foregroundStyle(.secondarytext)
//    //                    Text("Date Archived: \(archivedBrainstorm.archivedDate, format: .dateTime.day().month().year())")
//    //                        .foregroundStyle(.secondarytext)
//                        
//                        Text(archivedBrainstorm.brainstormText)
//                            .font(.title3)
//                            .foregroundStyle(.primarytext)
//                    }
//                    .padding()
//                    .background(
//                        RoundedRectangle(cornerRadius: 20, style: .continuous)
//                            .foregroundStyle(.listbackground)
//                    )
//
//                    if archivedBrainstorm.keywords.isEmpty == false {
//                        Divider()
//                            .frame(height: 2)
//                            .background(Color.borders)
//                            .padding(.vertical, 8)
//
//                        Text("Keywords in your Brainstorm:")
//                            .font(.title2.bold())
//                            .foregroundStyle(.tertiarytext)
//    //                    Text(archivedBrainstorm.keywords)
//    //                        .foregroundStyle(.tertiarytext)
//                    } else {
//                        Text("There are no Keywords for your Brainstorm.")
//                            .font(.title3)
//                            .foregroundStyle(.umorange)
//                    }
//                    VStack {
//                        // Create spacing to force Manage Categories above tab bar
//                        Text(" ")
//                    }
//                    .padding(.bottom, 20)
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding()
//                .sheet(isPresented: $showCategoryEditSheet) {
//    //                CategoryEditSheet(brainstorm: brainstorm)
//    //                    .presentationDetents([.medium])
//                }
//                .sheet(isPresented: $showPriorityEditSheet) {
//    //                PriorityEditSheet(brainstorm: brainstorm)
//    //                    .presentationDetents([.medium])
//                }{
//                    VStack(alignment: .leading) {
//                        VStack {
//                            if archivedBrainstorm.summary.isEmpty == false {
//                                Text("Archived Brainstorm")
//                                    .font(.caption)
//                                    .foregroundStyle(Color.umpuke)
//                                Text("Summary of your Brainstorm")
//                                    .font(.title2.bold())
//                                    .foregroundStyle(.primarytext)
//                                    .padding(.bottom, 8)
//                                Divider()
//                                    .frame(width: 200, height: 1)
//                                    .background(Color.borders)
//                                Text(archivedBrainstorm.summary)
//                                    .font(.title2)
//                                    .foregroundStyle(.primarytext)
//                            } else {
//                                Text("There is no Summary for your Brainstorm.")
//                                    .font(.title2)
//                                    .foregroundStyle(.umorange)
//                            }
//                        }
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(
//                            RoundedRectangle(cornerRadius: 20, style: .continuous)
//                                .foregroundStyle(.listbackground)
//                        )
//                        Divider()
//                            .frame(height: 2)
//                            .background(Color.borders)
//                            .padding(.vertical, 8)
//                        VStack {
//                            Text("Archived Brainstorm")
//                                .font(.caption)
//                                .foregroundStyle(Color.umpuke)
//                            Text("Your Full Brainstorm")
//                                .font(.title2.bold())
//                                .foregroundStyle(.primarytext)
//                            Divider()
//                                .frame(width: 200, height: 1)
//                                .background(Color.borders)
//                            VStack(alignment: .leading, spacing: 10) {
//                                HStack (alignment: .center, spacing: 10) {
//                                    Image(systemName: archivedBrainstorm.category.systemImage)
//                                        .font(.system(size: 26))
//                                        .padding(.bottom, 5)
//                                        .foregroundStyle(archivedBrainstorm.category.color)
//                                    Text("Category: \(archivedBrainstorm.category.rawValue)")
//                                        .padding(.bottom, 5)
//                                        .foregroundStyle(.primarytext)
//                                    Spacer()
//                                    Button {
//                                        showCategoryEditSheet = true
//                                    } label: {
//                                        Image(systemName: "square.and.pencil")
//                                            .font(.system(size: 26))
//                                            .foregroundStyle(.primarytext)
//                                    }
//                                }
//                                HStack (alignment: .center, spacing: 10) {
//                                    Image(systemName: archivedBrainstorm.priority.systemImage)
//                                        .font(.system(size: 26))
//                                        .foregroundStyle(archivedBrainstorm.priority.color)
//                                    Text("Priority: \(archivedBrainstorm.priority.rawValue)")
//                                        .foregroundStyle(.primarytext)
//                                    Spacer()
//                                    Button {
//                                        showPriorityEditSheet = true
//                                    } label: {
//                                        Image(systemName: "square.and.pencil")
//                                            .font(.system(size: 26))
//                                            .foregroundStyle(.primarytext)
//                                    }
//                                }
//                                HStack (alignment: .center, spacing: 10) {
//                                    Image(systemName: "arrow.up.bin")
//                                        .font(.system(size: 26))
//                                        .foregroundStyle(archivedBrainstorm.priority.color)
//                                    Text("Unarchive Brainstorm")
//                                        .foregroundStyle(.primarytext)
//                                    Spacer()
//                                    Button {
//                                        showUnarchiveAlert = true
//                                    } label: {
//                                        Image(systemName: "checkmark")
//                                            .font(.system(size: 26))
//                                            .foregroundStyle(.primarytext)
//                                    }
//                                }
//                            }
//                            Text("Date Created: \(archivedBrainstorm.date, format: .dateTime.day().month().year())")
//                                .foregroundStyle(.secondarytext)
//        //                    Text("Date Archived: \(archivedBrainstorm.archivedDate, format: .dateTime.day().month().year())")
//        //                        .foregroundStyle(.secondarytext)
//
//                            Text(archivedBrainstorm.brainstormText)
//                                .font(.title3)
//                                .foregroundStyle(.primarytext)
//                        }
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 20, style: .continuous)
//                                .foregroundStyle(.listbackground)
//                        )
//
//                        if archivedBrainstorm.keywords.isEmpty == false {
//                            Divider()
//                                .frame(height: 2)
//                                .background(Color.borders)
//                                .padding(.vertical, 8)
//
//                            Text("Keywords in your Brainstorm:")
//                                .font(.title2.bold())
//                                .foregroundStyle(.tertiarytext)
//        //                    Text(archivedBrainstorm.keywords)
//        //                        .foregroundStyle(.tertiarytext)
//                        } else {
//                            Text("There are no Keywords for your Brainstorm.")
//                                .font(.title3)
//                                .foregroundStyle(.umorange)
//                        }
//                        VStack {
//                            // Create spacing to force Manage Categories above tab bar
//                            Text(" ")
//                        }
//                        .padding(.bottom, 20)
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding()
//                    .sheet(isPresented: $showCategoryEditSheet) {
//        //                CategoryEditSheet(brainstorm: brainstorm)
//        //                    .presentationDetents([.medium])
//                    }
//                    .sheet(isPresented: $showPriorityEditSheet) {
//        //                PriorityEditSheet(brainstorm: brainstorm)
//        //                    .presentationDetents([.medium])
//                    }
//                }
            }
        }
//        .background(.background.opacity(0.2))
//        .toolbar {
//            ToolbarItem(placement: .principal) {
//                Text("My 3am Brainstorm")
//                    .font(.system(size: 26, weight: .bold, design: .rounded))
//                    .foregroundStyle(.navtitle)
//            }
//            ToolbarItem(placement: .topBarTrailing) {
//                Menu("More", systemImage: "ellipsis") {
//                    Button("Edit", systemImage: "square.and.pencil") {
//                        showArchivedBrainstormEditSheet = true
//                    }
//                    Button {
////                        printAView(view: BrainstormPrintView(brainstorm: brainstorm), jobName: "My Brainstorm")
//                    } label: {
//                        Label("Print Brainstorm", systemImage: "printer")
//                            .padding()
//                            .foregroundStyle(.white)
//                            .background(Color.blue)
//                            .cornerRadius(10)
//                    }
//                    Button("Share", systemImage: "square.and.arrow.up") {
//                        //isShowingDetailInformationSheet = true
//                    }
//                    Button("Add Photo", systemImage: "photo.fill") {
//                        //isShowingDetailInformationSheet = true
//                    }
//                    Button("Delete", systemImage: "trash", role: .destructive) {
//                        showDeleteAlert = true
//                    }
//                }
//                .background(Color.white)
//            }
//        }
//        .alert("Delete Brainstorm?", isPresented: $showDeleteAlert) {
//            Button("Delete This Brainstorm", role: .destructive) {
//                brainstormsManager.deleteArchivedBrainstorm(archivedBrainstorm: archivedBrainstorm, modelContext: modelContext)
//            }
//            Button("Cancel", role: .cancel) {}
//        } message: {
//            Text("This will permanently delete this Brainstorm. It cannot be undone.")
//        }
//        .alert("Unarchive Brainstorm?", isPresented: $showUnarchiveAlert) {
//            Button("Unarchive This Brainstorm") {
//                brainstormsManager.unarchiveBrainstorm(archivedBrainstorm: archivedBrainstorm, modelContext: modelContext)
//            }
//            Button("Cancel", role: .cancel) {}
//        } message: {
//            Text("This will unarchive this Brainstorm. It can be archived again later, as long as it has not been deleted.")
//        }
//        .sheet(isPresented: $showArchivedBrainstormEditSheet) {
//            ArchivedBrainstormEditSheet(archivedBrainstorm: archivedBrainstorm)
//                .presentationDetents([.medium, .large])
//        }
//    }
}

//#Preview {
//    ArchivedBrainstormDetailView()
//}

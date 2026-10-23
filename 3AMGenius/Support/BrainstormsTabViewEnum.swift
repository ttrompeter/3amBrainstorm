//
//  BrainstormTabs.swift
//  3AMGenius
//
//  Created by Thomas Trompeter on 10/19/26.
//

import SwiftUI

enum BrainstormsTabViewEnum: String, CaseIterable, Hashable, View {
    case list, settings
   
    var id: Self { self }
    
    var tabItem: BrainstormsTabItem {
        switch self {
        case .list:
                .init(name: "List", systemImage: "list.bullet")
        case .settings:
                .init(name: "Settings", systemImage: "gearshape")
        }
    }
    
    var body: some View {
        switch self {
        case .list:
            ListView()
        case .settings:
            SettingsView()
        }
    }
}

//
//  Category.swift
//  3AMGenius
//
//  Created by Thomas Trompeter on 10/15/26.
//

import SwiftUI

enum Category: String, Codable, CaseIterable {
    case coding = "Coding"
    case financial = "Financial"
    case legal = "Legal"
    case misc = "Miscellaneous"
    case oca = "OCA"
    case personal = "Personal"
    
    
    var systemImage: String {
        switch self {
        case .coding:
            "apps.ipad"
        case .financial:
            "dollarsign"
        case .legal:
            "building.classical.columns.fill"
        case .misc:
            "folder"
        case .oca:
            "house.lodge"
        case .personal:
            "person"
        }
    }
    
    var color: Color {
        switch self {
        case .coding:
                .orange
        case .financial:
                .green
        case .legal:
                .blue
        case .misc:
                .teal
        case .oca:
                .mint
        case .personal:
                .indigo
        }
    }
}

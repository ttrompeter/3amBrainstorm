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
            "ipad.landscape.and.iphone"
        case .financial:
            "dollarsign.square.fill"
        case .legal:
            "building.classical.columns.fill"
        case .misc:
            "folder.fill"
        case .oca:
            "house.fill"
        case .personal:
            "person.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .coding:
                .umbrown
        case .financial:
                .umblue
        case .legal:
                .umtan
        case .misc:
                .umpuke
        case .oca:
                .umgray
        case .personal:
                .umyellow
        }
    }
}

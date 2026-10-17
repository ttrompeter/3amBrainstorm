//
//  Idea.swift
//  3AMGenius
//
//  Created by Thomas Trompeter on 10/7/26.
//

import SwiftUI
import SwiftData

@Model
class Brainstorm {
    var ideaText: String
    var date: Date
    var summary: String
    var keywords: String
    
    init(ideaText: String, date: Date = .now) {
        self.ideaText = ideaText
        self.date = date
        summary = ""
        keywords = ""
    }
    
    
    enum Category: String {
        case coding = "Coding"
        case financial = "Financial"
        case legal = "Legal"
        case misc = "Miscellaneous"
        case oca = "OCA"
        case personal = "Personal"
        
        
        var systemImage: String {
            switch self {
            case .coding:
                "leaf.fill"
            case .financial:
                "birthday.cake.fill"
            case .legal:
                "cart.fill"
            case .misc:
                "shippingbox.fill"
            case .oca:
                "waterbottle.fill"
            case .personal:
                "leaf.fill"
            }
        }
        
        var color: Color {
            switch self {
            case .coding:
                    .green
            case .financial:
                    .orange
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
}

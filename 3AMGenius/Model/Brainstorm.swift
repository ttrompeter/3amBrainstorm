//
//  Brainstorm.swift
//  3AMGenius
//
//  Created by Thomas Trompeter on 10/7/26.
//

import SwiftUI
import SwiftData

@Model
class Brainstorm {
    var brainstormText: String
    var date: Date
    var categoryRaw: String
    var summary: String
    var keywords: String
    
//    init(brainstormText: String, date: Date = .now) {
//        self.brainstormText = brainstormText
//        self.date = date
//        summary = ""
//        keywords = ""
//    
//    }
    
    init(brainstormText: String, date: Date = .now, category: Category) {
        self.brainstormText = brainstormText
        self.date = date
        self.categoryRaw = category.rawValue
        summary = ""
        keywords = ""
    
    }
    
    var category: Category {
        get {
            Category(rawValue: categoryRaw) ?? .misc
        }
        set {
            categoryRaw = newValue.rawValue
        }
    }
}

//
//  BrainstormService.swift
//  3AMGenius
//
//  Created by Thomas Trompeter on 10/7/26.
//

import Foundation

@Observable
class BrainstormService {
    var brainstormItems: [Brainstorm]
    
    init(brainstormItems: [Brainstorm]) {
        self.brainstormItems = brainstormItems
    }
    
//    func itemsFilteredBy(_ filterString: String) -> [GroceryItem] {
//        let strippedFilter = filterString.trimmingCharacters(in: .whitespacesAndNewlines)
//        guard !filterString.isEmpty else {
//            return groceryItems
//                .sorted(using: KeyPathComparator(\GroceryItem.name))
//        }
//        return groceryItems
//            .filter {$0.name.localizedCaseInsensitiveContains(strippedFilter)}
//            .sorted(using: KeyPathComparator(\GroceryItem.name))
//    }
    
//    func groupedFilteredBy(_ filterString: String) -> [GroceryItem.Category: [GroceryItem]] {
//        let filteredItems = itemsFilteredBy(filterString)
//        return Dictionary(grouping: filteredItems, by: \.category)
//    }
    
//    var itemsGroupedByAlphabet: [String: [GroceryItem]] {
//        let filteredItems = itemsFilteredBy("")
//        let dict = Dictionary(grouping: filteredItems, by: { item in
//            item.name.prefix(1).uppercased()
//        })
//        let allLetters = (65...90).map { String(UnicodeScalar($0)!)}
//        var result = [String: [GroceryItem]]()
//        for letter in allLetters {
//            result[letter] = dict[letter, default: []]
//        }
//        return result
//    }
}

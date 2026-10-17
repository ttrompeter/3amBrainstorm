//
//  BrainstormMetaData.swift
//  3AMGenius
//
//  Created by Thomas Trompeter on 10/8/26.
//

import FoundationModels

@Generable
struct BrainstormMetadata {
    @Guide(description: "A concise one-sentence summary of the Brainstorm.")
    var summary: String
    @Guide(description: "Alternative search phrases using synonyms, equivalents, analogues, broader concepts, adjacent domains, likely use cases, any related issue or brainstorm. Do NOT copy wording from the text.", .count(12))
    var keywords: [String]
    
    
}

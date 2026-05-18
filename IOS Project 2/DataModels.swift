//
//  DataModels.swift
//  IOS Project 2
//
//  Created by Student on 5/5/26.
//

import Foundation

struct Deck: Codable {
    var deck_id: String
    var cards: [Card]
    var remaining: Int
}

struct Card: Codable, Identifiable {
    var code: String
    var image: String
    var value: String
    var suit: String
    var id = UUID()
    
    enum CodingKeys: String, CodingKey {
        case code
        case image
        case value
        case suit
    }
}


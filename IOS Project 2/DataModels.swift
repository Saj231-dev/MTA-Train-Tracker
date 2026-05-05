//
//  DataModels.swift
//  IOS Project 2
//
//  Created by Student on 5/5/26.
//

import Foundation

struct Deck: Codable {
    var deck_id: String
    var remaining: Int
    var shuffled: Bool
}

struct Card: Codable, Identifiable {
    var id: Int
    var code: String
    var image: String
    var value: Int
    var suit: String
}

// Note: This might or might not work, we have to set up the basic api decoding stuff beforehand

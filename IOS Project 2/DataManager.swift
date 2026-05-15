//
//  DataManager.swift
//  IOS Project 2
//
//  Created by Student on 4/30/26.
//

import SwiftUI

@Observable
class DataManager {
    let apiURL = "https://deckofcardsapi.com/api/deck/"
    var drawAmount = 52
    
    init(drawAmount: Int = 52) {
        self.drawAmount = drawAmount
    }
    
    private func getDeckID() async -> DeckID? {
        let urlStr = self.apiURL + "new"
        let url: URL? = URL(string: urlStr)
        guard let urlUnwrapped = url else {
            return nil
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: urlUnwrapped)
            if let responseConverted = response as? HTTPURLResponse {
                print("status code: \(responseConverted.statusCode)")
            }
            let deckID: DeckID = try JSONDecoder().decode(DeckID.self, from: data)
            return deckID
        } catch let error {
            print(error)
            return nil
        }
    }
    
    func drawCard() async -> (deck: Deck, deckID: DeckID)? {
        let deckID = await getDeckID()
        guard let unwrappedID = deckID else {
            return nil
        }
        let cardURL = apiURL + unwrappedID.deck_id + "/draw/?count=\(self.drawAmount)"
        print(unwrappedID.deck_id)
        let url: URL? = URL(string: cardURL)
        guard let urlUnwrapped = url else {
            return nil
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: urlUnwrapped)
            if let responseConverted = response as? HTTPURLResponse {
                print("status code: \(responseConverted.statusCode)")
            }
            let deck: Deck = try JSONDecoder().decode(Deck.self, from: data)
            return (deck, unwrappedID)
        } catch let error {
            print(error)
            return nil
        }
    }
    
    func shuffle(deckID: String) async {
        let shuffleURL = apiURL + "\(deckID)/shuffle/"
        let url: URL? = URL(string: shuffleURL)
        guard let urlUnwrapped = url else {
            return
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: urlUnwrapped)
            if let responseConverted = response as? HTTPURLResponse {
                print("status code: \(responseConverted.statusCode)")
            }
            let deck: Deck = try JSONDecoder().decode(Deck.self, from: data)
        } catch let error {
            print(error)
        }
    }
}

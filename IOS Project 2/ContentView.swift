//
//  ContentView.swift
//  IOS Project 2
//
//  Created by Student on 4/28/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(DataManager.self) private var dataManager: DataManager
    @State private var cards: [Card] = []
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(cards) { card in
                        Text(card.suit)
                    }
                }
            }
        }
        .task {
            let deck = await dataManager.drawCard()
            if let unwrappedDeck = deck {
                for card in unwrappedDeck.deck.cards {
                    cards.append(card)
                }
                if cards.count == 52 {
                    await dataManager.shuffle(deckID: unwrappedDeck.deckID.deck_id)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(DataManager())
}

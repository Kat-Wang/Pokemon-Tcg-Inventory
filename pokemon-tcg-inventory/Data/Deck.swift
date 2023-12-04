//
//  Deck.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 12/2/23.
//

import Foundation


struct Deck: Identifiable {
    var id: UUID
    var name: String
    var cards: [Card]
}

struct DeckMockData {
    static var sampleDeck = Deck(id: UUID(), name: "my tesing deck", cards: [MockData.samplePokemonCard,MockData.samplePokemonCard,MockData.samplePokemonCard])
}

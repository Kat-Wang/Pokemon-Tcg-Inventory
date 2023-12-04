//
//  Deck.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 12/2/23.
//

import Foundation


struct Deck {
    var name: String
    var cards: [Card]
}

struct DeckMockData {
    static var sampleDeck = Deck(name: "my tesing deck", cards: [MockData.samplePokemonCard,MockData.samplePokemonCard,MockData.samplePokemonCard])
}

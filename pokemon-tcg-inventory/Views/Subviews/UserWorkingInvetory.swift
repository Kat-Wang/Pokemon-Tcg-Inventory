//
//  UserWorkingInvetory.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 12/4/23.
//

import Foundation
import SwiftUI
import AVFoundation

struct UserCardInventory: View {
    @Binding var workingInventory: [Card]
    @Binding var user: User
    
    var soundEnabled: Bool
    
    var body: some View {
        HStack (spacing: 0) {
            WorkingInventoryCardList(supertype: "Pok\u{00E9}mon", workingInventory: $workingInventory, editable: false)
            WorkingInventoryCardList(supertype: "Trainer", workingInventory: $workingInventory, editable: false)
            WorkingInventoryCardList(supertype: "Energy", workingInventory: $workingInventory, editable: false)
        }
    }
}

struct UserDeckInventory: View {
    @Binding var workingInventory: [Deck]
    
    @State private var selectedDeck: Deck?
    @State private var isSheetPresented = false
    
    var body: some View {
        VStack {
            Text("Decks")
                .font(Font.custom("Inter-Regular_Light", size: 20))
                .underline()
                .multilineTextAlignment(.center)
                .padding()
            
            let groupedDecks = Dictionary(grouping: workingInventory, by: { $0.name })
            
            List {
                ForEach(groupedDecks.keys.sorted(), id: \.self) { id in
                    if let currentDecks = groupedDecks[id] {
                        let firstDeck = currentDecks.first!
                        
                        Button(action: {
                            selectedDeck = firstDeck
                        }) {
                            Text("\(firstDeck.name)")
                                .font(.system(size: 10))
                        }
                    }
                }
            }
            .padding(-10)
            .listStyle(PlainListStyle())
            .sheet(item: $selectedDeck) { deck in
                HStack {
                    Spacer()
                    Button {
                        selectedDeck = nil
                    } label: {
                        Image(systemName: "x.square")
                    }
                    .padding()
                }
                DeckDetailView(deck: deck)
            }
        }
    }
}

struct DeckDetailView: View {
    var deck: Deck
    
    @State private var deckCards: [Card]
    
    init(deck: Deck) {
        self.deck = deck
        _deckCards = State(initialValue: deck.cards)
    }
    
    var body: some View {
        HStack {
            WorkingInventoryCardList(supertype: "Pok\u{00E9}mon", workingInventory: $deckCards, editable: false)
            WorkingInventoryCardList(supertype: "Trainer", workingInventory: $deckCards, editable: false)
            WorkingInventoryCardList(supertype: "Energy", workingInventory: $deckCards, editable: false)
        }
    }
}

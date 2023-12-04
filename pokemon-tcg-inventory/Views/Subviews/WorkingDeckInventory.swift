//
//  WorkingInventory.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 12/3/23.
//

import SwiftUI
import AVFoundation

struct WorkingDeckInventory: View {
    @Binding var workingInventory: [Card]
    @Binding var user: User
    @Binding var deckName: String
    
    var isDarkMode: Bool
    var soundEnabled: Bool
    

    var body: some View {
        VStack {
            Rectangle()
                .stroke(Color(isDarkMode ? .white : .black), lineWidth: 1)
                .frame(width: 280, height: 40)
                .overlay(
                    TextField("Deck Name", text: $deckName)
                        .font(Font.custom("Inter-Regular_Light", size: 15))
                        .padding([.leading, .trailing], 8)
                        .autocorrectionDisabled()
                )
            
            HStack (spacing: 0) {
                WorkingInventoryCardList(supertype: "Pok\u{00E9}mon", workingInventory: $workingInventory)
                WorkingInventoryCardList(supertype: "Trainer", workingInventory: $workingInventory)
                WorkingInventoryCardList(supertype: "Energy", workingInventory: $workingInventory)
            }
            
            Button {
                var workingDeck = Deck(id: UUID(), name: "", cards: [])

                for card in workingInventory {
                    workingDeck.cards.append(card)
                }
                workingInventory = []
                
                workingDeck.name = deckName
                
                user.deckCollection.collection.append(workingDeck)
                
                deckName = ""
                
                if soundEnabled {AudioServicesPlaySystemSound(1111)}
            } label: {
                Text("Save Deck")
                    .padding()
                    .background(Color(hex: "#4484b2"))
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
        }
    }
}

struct WorkingDeckCardList: View {
    var supertype: String
    @Binding var workingInventory: [Card]
        
    var body: some View {
        VStack {
            Text(supertype)
                .font(Font.custom("Inter-Regular_Light", size: 20))
                .underline()
                .multilineTextAlignment(.center)
                .padding()
            
            let filteredCards = workingInventory.filter { $0.supertype == supertype }
                    let groupedCards = Dictionary(grouping: filteredCards, by: { $0.id })

                    List {
                        ForEach(groupedCards.keys.sorted(), id: \.self) { cardID in
                            if let currentCards = groupedCards[cardID] {
                                let count = currentCards.count
                                let firstCard = currentCards.first! // Assuming at least one card is present

                                HStack {
                                    cardCountIcon(count: count)

                                    Text("\(firstCard.name) (\(firstCard.set!.name))")
                                        .font(.system(size: 10))
                                }
                            }
                        }
                    }
                    .padding(-10)
                    .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    WorkingDeckInventory(workingInventory: .constant([MockData.samplePokemonCard,MockData.samplePokemonCard,MockData.samplePokemonCard, MockData.sampleEnergyCard, MockData.sampleEnergyCard, MockData.sampleTrainerCard, MockData.sampleTrainerCard, MockData.sampleEnergyCard2]), user: .constant(sampleUser), deckName: .constant("Potato"), isDarkMode: true, soundEnabled: true)
}

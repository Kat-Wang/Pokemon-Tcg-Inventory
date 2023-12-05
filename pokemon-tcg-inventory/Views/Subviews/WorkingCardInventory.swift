//
//  WorkingInventory.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 12/3/23.
//

import SwiftUI
import AVFoundation

struct WorkingCardInventory: View {
    @Binding var workingInventory: [Card]
    @Binding var user: User
    
    var soundEnabled: Bool
    
    var body: some View {
        VStack {
            HStack (spacing: 0) {
                WorkingInventoryCardList(supertype: "Pok\u{00E9}mon", workingInventory: $workingInventory)
                WorkingInventoryCardList(supertype: "Trainer", workingInventory: $workingInventory)
                WorkingInventoryCardList(supertype: "Energy", workingInventory: $workingInventory)
            }
            
            Button {
                for card in workingInventory {
                    user.cardCollection.collection.append(card)
                }
                
                workingInventory = []
                
                if soundEnabled{
                    AudioServicesPlaySystemSound(1111)
                }
                
            } label: {
                Text("Save in Inventory")
                    .padding()
                    .background(Color(hex: "#4484b2"))
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
        }
    }
}

struct cardCountIcon: View {
    var count: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(hex: "#A0CFD5"))
                .frame(width: 15, height: 20)
                .cornerRadius(1)
            
            Text("\(count)")
                .font(.caption)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
        }
    }
}

struct WorkingInventoryCardList: View {
    var supertype: String
    @Binding var workingInventory: [Card]
    var editable: Bool = true
    
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
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            if editable {
                                Button {
                                    if let index = workingInventory.firstIndex(where: { $0.id == cardID }) {
                                        workingInventory.remove(at: index)
                                        
                                    }
                                } label: {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                }
            }
            .padding(-10)
            .listStyle(PlainListStyle())
        }
    }
}

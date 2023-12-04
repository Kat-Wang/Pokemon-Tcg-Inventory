//
//  InventoryView.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/26/23.
//

import SwiftUI

struct InventoryView: View {
    
    @Binding var user: User
    var soundEnabled: Bool
    
    @State var inventoryFilters = ["cards": false, "decks": false]
    @State var inventoryGrid: [Card] = []
    
    var body: some View {
        VStack {
            Text("Inventory")
                .font(Font.custom("Inter-Regular_Light", size: 35))
                .multilineTextAlignment(.center)
            
            HStack {
                InventoryFilterButton(text: "Cards", filter: "cards", inventoryFilters: $inventoryFilters)
                InventoryFilterButton(text: "Decks", filter: "decks", inventoryFilters: $inventoryFilters)
            }
            
            if inventoryFilters["cards"]! {
                UserCardInventory(workingInventory: $user.cardCollection.collection, user: $user, soundEnabled: soundEnabled)
            } else if inventoryFilters["decks"]! {
                UserDeckInventory(workingInventory: $user.deckCollection.collection)
            }
        }
    }
    
}

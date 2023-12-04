//
//  WorkingInventory.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 12/3/23.
//

import SwiftUI

struct WorkingInventory: View {
    @Binding var workingInventory: [Card]
    
    var body: some View {
        HStack {
            Text("Pokemon")
                .font(Font.custom("Inter-Regular_Light", size: 20))
                .underline()
                .multilineTextAlignment(.leading)
                .padding()
            Text("Trainers")
                .font(Font.custom("Inter-Regular_Light", size: 20))
                .underline()
                .multilineTextAlignment(.center)
                .padding()
            Text("Energies")
                .font(Font.custom("Inter-Regular_Light", size: 20))
                .underline()
                .multilineTextAlignment(.trailing)
                .padding()
        }
        
        
        HStack {
            WorkingInventoryCardList(workingInventory: $workingInventory)
        }
    }
}

struct WorkingInventoryCardList: View {
    @Binding var workingInventory: [Card]
    
    var body: some View {
        List {
            ForEach(workingInventory) {card in
                Text(card.name)
            }
        }
    }
}

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
            WorkingInventoryCardList(supertype: "Pokemon", workingInventory: $workingInventory)
            WorkingInventoryCardList(supertype: "Trainer", workingInventory: $workingInventory)
            WorkingInventoryCardList(supertype: "Energy", workingInventory: $workingInventory)
        }
        .padding([.leading, .trailing], 0)
    }
}

struct WorkingInventoryCardList: View {
    var supertype: String
    @Binding var workingInventory: [Card]
    
    var runningList: [Card] = []
    
    var body: some View {
        VStack {
            Text(supertype)
                .font(Font.custom("Inter-Regular_Light", size: 20))
                .underline()
                .multilineTextAlignment(.center)
                .padding()
            
            List {
                ForEach(workingInventory.indices, id: \.self) {i in
                    HStack {
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 10, height: 10)
                        Text(workingInventory[i].name + " " + workingInventory[i].set!.name)
                            .font(.caption)
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    WorkingInventory(workingInventory: .constant([MockData.sampleCard,MockData.sampleCard,MockData.sampleCard]))
}

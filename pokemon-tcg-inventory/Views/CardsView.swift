//
//  Cards.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/26/23.
//

import SwiftUI

struct CardsView: View {
    
    @State var cardFilters = CardFilters()
    
    var body: some View {
        
        HStack {
            FilterButton(text: "Pokemon", filter: "pokemon", cardFilters: $cardFilters)
            FilterButton(text: "Trainer", filter: "trainer", cardFilters: $cardFilters)
            FilterButton(text: "Energy", filter: "energy", cardFilters: $cardFilters)
        }
    }
}

#Preview {
    CardsView()
}

struct FilterButton: View {
    
    var text: String
    var filter: String
    
    @Binding var cardFilters: CardFilters
    
    var body: some View {
        
        Button {
            cardFilters.filters[filter] = !cardFilters.filters[filter]!
            print(cardFilters.filters[filter]! as Bool)
        } label: {
            Text(text)
                .frame(width: 100, height: 35)
                .foregroundColor(cardFilters.filters[filter]! ? .white : .black)
                .background(RoundedRectangle(
                    cornerRadius: 20,
                    style: .continuous
                )
                    .fill(cardFilters.filters[filter]! ? Color(hex: "#4484b2") : .white)
                )
                .overlay {
                    
                    RoundedRectangle(
                        cornerRadius: 20,
                        style: .continuous
                    )
                    .stroke(cardFilters.filters[filter]! ? Color(hex: "#4484b2") : .gray, lineWidth: 2)
                }
        }
    }
}

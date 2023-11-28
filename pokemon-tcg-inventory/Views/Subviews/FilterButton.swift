//
//  FilterButton.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/28/23.
//

import SwiftUI

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
                .font(.caption)
                .frame(width: 75, height: 35)
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

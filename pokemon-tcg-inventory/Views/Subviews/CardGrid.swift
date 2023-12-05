//
//  CardGrid.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 12/4/23.
//

import Foundation
import SwiftUI

struct CardCell: View {
    @Binding var workingInventory: [Card]
    var card: Card
    @State private var isAnimating = false
    
    var body: some View {
        HStack {
            CardRemoteImage(urlString: card.images!.large)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 168)
                .cornerRadius(8)
                .opacity(isAnimating ? 0.0 : 1.0)
                .onTapGesture {
                    workingInventory.append(card)
                    
                    withAnimation(.easeInOut(duration: 0.1)) {
                        isAnimating.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            isAnimating.toggle()
                        }
                    }
                }
        }
    }
}

struct CardGrid: View {
    var cards: [Card]
    var isCardAnimating: Bool
    @Binding var selectedCard: Card?
    @Binding var displayCard: Bool
    @Binding var workingInventory: [Card]
    
    var body: some View {
        LazyVGrid(columns: cardColumns) {
            ForEach(cards){card in
                CardCell(workingInventory: $workingInventory, card: card)
                    .opacity(isCardAnimating ? 0.0 : 1.0)
                    .highPriorityGesture(TapGesture(count: 2).onEnded { _ in
                        selectedCard = card
                        displayCard = true
                    })
                    .background(
                        GeometryReader { geo in
                            Color.clear.preference(key: ViewOffsetKey.self, value: geo.frame(in: .global))
                        }
                    )
            }
        }
    }
}

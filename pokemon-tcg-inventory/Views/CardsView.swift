//
//  Cards.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/26/23.
//

import SwiftUI


let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

struct CardsView: View {
    
    @State var cardFilters = CardFilters()
    
    var body: some View {
        
        VStack {
            HStack {
                FilterButton(text: "Pokemon", filter: "pokemon", cardFilters: $cardFilters)
                FilterButton(text: "Trainer", filter: "trainer", cardFilters: $cardFilters)
                FilterButton(text: "Energy", filter: "energy", cardFilters: $cardFilters)
            }
            
            LazyVGrid(columns: columns){
                ForEach(MockData.frameworks){framework in
                    NavigationLink(value: framework){
                        FrameworkTitleView(framework: framework)
                    }
                }
            }
        }
        
        
    }
}

#Preview {
    CardsView()
}



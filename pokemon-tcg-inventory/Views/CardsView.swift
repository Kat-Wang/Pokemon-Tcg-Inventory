//
//  Cards.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/26/23.
//

import SwiftUI


let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

struct CardsView: View {
    
    @State var cardFilters = CardFilters()
    
    var body: some View {
        
        VStack {
            HStack {
                SupertypeFilterButton(text: "Pokemon", filter: "pokemon", cardFilters: $cardFilters)
                SupertypeFilterButton(text: "Trainer", filter: "trainer", cardFilters: $cardFilters)
                SupertypeFilterButton(text: "Energy", filter: "energy", cardFilters: $cardFilters)
            }
            PokemonSubTypesFilters(cardFilters: cardFilters)
        }
    }
}

#Preview {
    CardsView()
}

struct FilterButtonGrid: View {
    
    var filters: [String]
    var filterNames: [String]
    var cardFilters: CardFilters
    
    var body: some View {
        
        LazyVGrid(columns: columns){
            ForEach(0...(filterNames.count-1), id: \.self){
                FilterButton(text: filterNames[$0], filter: filters[$0], cardFilters: cardFilters)
            }
        }
        .padding([.trailing, .leading, .bottom], 10)
    }
}

struct PokemonSubTypesFilters: View {

    var cardFilters: CardFilters
    
    @State var pokemonSubtypeSegCtl = 0
    
    var body: some View {
        VStack {
            Picker("Select a Pokemon subtype", selection: $pokemonSubtypeSegCtl) {
                Text("Stage").tag(0)
                Text("Mechanic").tag(1)
                Text("Type").tag(2)
                Text("Label").tag(3)
                Text("Extra").tag(4)
            }
            .pickerStyle(.segmented)
            .frame(width: 350, height: 25)
            .padding(.top, 10)
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2)
                )
                .overlay(
                    segCtrlfilterButtonGrid
                )
                .frame(width: 350, height: 150)
        }
        }
    
    @ViewBuilder
    var segCtrlfilterButtonGrid: some View {
        switch pokemonSubtypeSegCtl {
        case 0:
            FilterButtonGrid(filters: cardFilters.stageFilters, filterNames: cardFilters.stageFilterNames, cardFilters: cardFilters)
        case 1:
            FilterButtonGrid(filters: cardFilters.mechanicFilters, filterNames: cardFilters.mechanicFilterNames, cardFilters: cardFilters)
        case 2:
            FilterButtonGrid(filters: cardFilters.typeFilters, filterNames: cardFilters.typeFilterNames, cardFilters: cardFilters)
        case 3:
            FilterButtonGrid(filters: cardFilters.labelFilters, filterNames: cardFilters.labelFilterNames, cardFilters: cardFilters)
        default:
            FilterButtonGrid(filters: cardFilters.extraFilters, filterNames: cardFilters.extraFilterNames, cardFilters: cardFilters)
        }
    }
    
}

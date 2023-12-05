//
//  SubtypeFilters.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/29/23.
//

import SwiftUI

struct PokemonSubtypeFilters: View {
    
    @Binding var cardFilters: CardFilters
    
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
                        .padding([.trailing, .leading], 10)
                )
                .frame(width: 350, height: 150)
        }
    }
    
    @ViewBuilder
    var segCtrlfilterButtonGrid: some View {
        switch pokemonSubtypeSegCtl {
        case 0:
            FilterButtonGrid(filters: cardFilters.stageFilters, filterNames: cardFilters.stageFilterNames, cardFilters: $cardFilters)
        case 1:
            FilterButtonGrid(filters: cardFilters.mechanicFilters, filterNames: cardFilters.mechanicFilterNames, cardFilters: $cardFilters)
        case 2:
            FilterButtonGrid(filters: cardFilters.typeFilters, filterNames: cardFilters.typeFilterNames, cardFilters: $cardFilters)
        case 3:
            FilterButtonGrid(filters: cardFilters.labelFilters, filterNames: cardFilters.labelFilterNames, cardFilters: $cardFilters)
        default:
            FilterButtonGrid(filters: cardFilters.extraFilters, filterNames: cardFilters.extraFilterNames, cardFilters: $cardFilters)
        }
    }
    
}

struct TrainerSubtypeFilters: View {
    
    @Binding var cardFilters: CardFilters
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2)
            )
            .overlay(
                FilterButtonGrid(filters: cardFilters.trainerFilters, filterNames: cardFilters.trainerFilterNames, cardFilters: $cardFilters)
                    .padding([.trailing, .leading], 10)
            )
            .frame(width: 350, height: 55)
    }
}

struct EnergySubtypeFilters: View {
    
    @Binding var cardFilters: CardFilters
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2)
            )
            .overlay(
                FilterButtonGrid(filters: cardFilters.energyFilters, filterNames: cardFilters.energyFilterNames, cardFilters: $cardFilters)
                    .padding([.trailing, .leading], 10)
            )
            .frame(width: 350, height: 55)
    }
}


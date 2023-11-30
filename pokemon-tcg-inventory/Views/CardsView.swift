//
//  Cards.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/26/23.
//

import SwiftUI



struct CardsView: View {
    
    @State var cardFilters = CardFilters()
    @State var searchField = ""
    
    var isDarkMode: Bool
    
    var body: some View {
        
        VStack {
            Text("Adding Cards")
                .font(Font.custom("Inter-Regular_Light", size: 35))
                .multilineTextAlignment(.center)
            
            Rectangle()
                .stroke(Color(isDarkMode ? .white : .black), lineWidth: 1)
               .frame(width: 330, height: 40)
               .overlay(
                    TextField("search cards", text: $searchField)
                        .font(Font.custom("Inter-Regular_Light", size: 15))
                        .padding([.leading, .trailing], 8)
               )
               .padding([.leading, .trailing, .bottom])
 
            HStack {
                SupertypeFilterButton(text: "Pokemon", filter: "pokemon", cardFilters: $cardFilters)
                SupertypeFilterButton(text: "Trainer", filter: "trainer", cardFilters: $cardFilters)
                SupertypeFilterButton(text: "Energy", filter: "energy", cardFilters: $cardFilters)
            }
            cardFilters.filters["pokemon"]! ? PokemonSubtypesFilters(cardFilters: $cardFilters) : nil
            cardFilters.filters["trainer"]! ? TrainerSubtypeFilters(cardFilters: $cardFilters) : nil
            cardFilters.filters["energy"]! ? EnergySubtypeFilters(cardFilters: $cardFilters) : nil

        }
    }
}

#Preview {
    CardsView(isDarkMode: false)
}

struct FilterButtonGrid: View {
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var filters: [String]
    var filterNames: [String]
    @Binding var cardFilters: CardFilters
    
    var body: some View {
        
        LazyVGrid(columns: columns){
            ForEach(0...(filterNames.count-1), id: \.self){
                FilterButton(text: filterNames[$0], filter: filters[$0], cardFilters: $cardFilters)
            }
        }
    }
}


struct PokemonSubtypesFilters: View {

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

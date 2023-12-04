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
        } label: {
            Text(text)
                .font(.caption)
                .frame(width: 80, height: 35)
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

struct SupertypeFilterButton: View {
    
    var text: String
    var filter: String
    
    @Binding var cardFilters: CardFilters
    
    var body: some View {
        Button {
            if filter == "pokemon" {
                for (filter, value) in cardFilters.filters {
                    if filter != "pokemon" {
                        cardFilters.filters[filter] = false
                    } else {
                        cardFilters.filters[filter] = value
                    }
                }
                
            } else if filter == "trainer" {
                for (filter, value) in cardFilters.filters {
                    if filter != "trainer" {
                        cardFilters.filters[filter] = false
                    } else {
                        cardFilters.filters[filter] = value
                    }
                }
            } else if filter == "energy" {
                for (filter, value) in cardFilters.filters {
                    if filter != "energy" {
                        cardFilters.filters[filter] = false
                    } else {
                        cardFilters.filters[filter] = value
                    }
                }
            }
            
            cardFilters.filters[filter] = !cardFilters.filters[filter]!
        } label: {
            Text(text)
                .font(Font.custom("Inter-Regular_Light", size: 12))
                .frame(width: 80, height: 35)
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

struct InventoryFilterButton: View {
    
    var text: String
    var filter: String
    
    @Binding var inventoryFilters: [String: Bool]
    
    var body: some View {
        Button {
            if filter == "cards" {
                for (filter, value) in inventoryFilters {
                    if filter != "cards" {
                        inventoryFilters[filter] = false
                    } else {
                        inventoryFilters[filter] = value
                    }
                }
                
            } else if filter == "decks" {
                for (filter, value) in inventoryFilters {
                    if filter != "decks" {
                        inventoryFilters[filter] = false
                    } else {
                        inventoryFilters[filter] = value
                    }
                }
            }
            
            inventoryFilters[filter] = !inventoryFilters[filter]!
        } label: {
            Text(text)
                .font(Font.custom("Inter-Regular_Light", size: 12))
                .frame(width: 80, height: 35)
                .foregroundColor(inventoryFilters[filter]! ? .white : .black)
                .background(RoundedRectangle(
                    cornerRadius: 10,
                    style: .continuous
                )
                    .fill(inventoryFilters[filter]! ? Color(hex: "#4484b2") : .white)
                )
                .overlay {
                    RoundedRectangle(
                        cornerRadius: 10,
                        style: .continuous
                    )
                    .stroke(inventoryFilters[filter]! ? Color(hex: "#4484b2") : .gray, lineWidth: 2)
                }
        }
    }
}

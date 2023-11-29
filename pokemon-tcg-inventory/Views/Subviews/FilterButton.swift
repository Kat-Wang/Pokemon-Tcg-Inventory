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

//TODO: Create a filter button specific to supertypes
struct SupertypeFilterButton: View {
    
    var text: String
    var filter: String
    
    @Binding var cardFilters: CardFilters
    
    var body: some View {
        Button {
            if filter == "pokemon" {
                cardFilters.filters["trainer"] = false
                cardFilters.filters["energy"] = false
                print("hello")
            } else if filter == "trainer" {
                cardFilters.filters["pokemon"] = false
                cardFilters.filters["energy"] = false
            } else if filter == "energy" {
                cardFilters.filters["pokemon"] = false
                cardFilters.filters["trainer"] = false
            }
            
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

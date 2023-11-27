//
//  Cards.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/26/23.
//

import SwiftUI

struct CardsView: View {
    var body: some View {
        MainCardFilter()
    }
}

#Preview {
    CardsView()
}

struct MainCardFilter: View {
    var body: some View {
        HStack {
            Button {
                
            }
            label : {
                Text("Pokemon")
                    .frame(width: 80, height: 20)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(hex: "#4484b2"))
            
            Button {
                
            } label : {
                Text("Trainer")
                    .frame(width: 80, height: 20)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(hex: "#4484b2"))
            
            Button {
                
            } label : {
                Text("Energy")
                    .frame(width: 80, height: 20)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(hex: "#4484b2"))


        }
    }
}

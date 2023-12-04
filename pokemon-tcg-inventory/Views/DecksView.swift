//
//  DecksView.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 12/2/23.
//

import SwiftUI

struct DecksView: View {
    
    @State var cardFilters = CardFilters()
    @State var alertItem: AlertItem?
    @State var searchField = ""
    @State var cards: [Card] = []
    @State var queryPage = 1
    
    var isDarkMode: Bool
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    Text("Adding Deck")
                        .font(Font.custom("Inter-Regular_Light", size: 35))
                        .multilineTextAlignment(.center)
                    
                }
            }
        }
    }
}

#Preview {
    DecksView(isDarkMode: false)
}

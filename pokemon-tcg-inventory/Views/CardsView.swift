//
//  Cards.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/26/23.
//

import SwiftUI

var cardColumns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]

struct CardsView: View {
    
    @State var cardFilters = CardFilters()
    @State var alertItem: AlertItem?
    @State var searchField = ""
    @State var cards: [Card] = []
    
    var isDarkMode: Bool
    
    var body: some View {
        
        ScrollView {
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
                cardFilters.filters["pokemon"]! ? PokemonSubtypeFilters(cardFilters: $cardFilters) : nil
                cardFilters.filters["trainer"]! ? TrainerSubtypeFilters(cardFilters: $cardFilters) : nil
                cardFilters.filters["energy"]! ? EnergySubtypeFilters(cardFilters: $cardFilters) : nil
                
                LazyVGrid(columns: cardColumns) {
                    ForEach(cards){card in
                        CardCell(card: card)
                    }
                }
            }
            .onChange(of: cardFilters.filters) {
                getCards()
            }
        }
        .alert(item: $alertItem) {alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
    
    func getCards(){
        //result is either a success case or error case
        NetworkManager.shared.getCards { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let cards):
                    self.cards = cards
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}

#Preview {
    CardsView(isDarkMode: false)
}


struct CardCell : View {
    
    var card: Card
    
    var body: some View {
        HStack {
            CardRemoteImage(urlString: card.images!.large)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 168)
                .cornerRadius(8)
        }
    }
}

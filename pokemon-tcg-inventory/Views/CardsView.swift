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
    @State var queryPage = 1
    
    var isDarkMode: Bool
    
    var body: some View {
        
        ScrollView {
            VStack {
                Text("Adding Cards")
                    .font(Font.custom("Inter-Regular_Light", size: 35))
                    .multilineTextAlignment(.center)
                
                SearchBar(searchField: $searchField, isDarkMode: isDarkMode)
                
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
                
                Button {
                    getMoreCards()
                } label: {
                    Text("Load More")
                }
                
            }
            .onChange(of: cardFilters.filters) {
                getCards()
            }
            .onChange(of: searchField) {
                getCards()
            }
            
        }
        .alert(item: $alertItem) {alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
    
    func getCards(){
        queryPage = 1
        NetworkManager.shared.getCards(for: queryPage, with: cardFilters, filterText: searchField) { result in
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
    
    func getMoreCards(){
        queryPage += 1
        
        NetworkManager.shared.getMoreCards(for: queryPage, with: cardFilters, filterText: searchField) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let cards):
                    self.cards.append(contentsOf: cards)
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

struct CardCell: View {
    
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


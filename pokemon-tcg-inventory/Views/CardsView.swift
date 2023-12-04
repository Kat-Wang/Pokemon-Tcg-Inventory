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
    @State var displayBagPanel = false
    @State var displayCard = false
    @State var selectedCard: Card?
    @State private var singleTap = false
    @State var workingInventory: [Card] = []
    @State var isCardAnimating = false
    
    @Binding var user: User
    
    var isDarkMode: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
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
                                    .opacity(isCardAnimating ? 0.0 : 1.0)
                                    .highPriorityGesture(TapGesture(count: 2).onEnded { _ in
                                        selectedCard = card
                                        displayCard = true
                                    })
                                    .simultaneousGesture(
                                        TapGesture(count: 1).onEnded {
                                            workingInventory.append(card)
                                        }
                                    )
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
                    
                    if displayCard {
                        CardRemoteImage(urlString: (selectedCard?.images!.large)!)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 360, height: 504)
                            .onTapGesture {
                                displayCard = false
                            }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink{
                        WorkingInventory(workingInventory: $workingInventory, user: $user)
                    } label: {
                        Label("Bag", systemImage: "gym.bag")
                    }
                }
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
    
    func startAnimationSequence() {
        withAnimation(.easeInOut(duration: 0.5)) {
            isCardAnimating = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 0.5)) {
                isCardAnimating = false
            }
        }
    }
}

#Preview {
    CardsView(user: .constant(sampleUser), isDarkMode: false)
}

struct CardCell: View {
    
    var card: Card
    @State private var isAnimating = false
    
    var body: some View {
        HStack {
            CardRemoteImage(urlString: card.images!.large)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 168)
                .cornerRadius(8)
                .opacity(isAnimating ? 0.0 : 1.0)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.1)) {
                        isAnimating.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            isAnimating.toggle()
                        }
                    }
                }
        }
    }
}


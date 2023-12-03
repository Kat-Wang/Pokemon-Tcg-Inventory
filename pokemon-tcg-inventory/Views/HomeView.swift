//
//  HomeView.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/25/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var user = User()
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        TabView {
            CardsView(isDarkMode: isDarkMode)
                .tabItem {
                    Image(systemName: "plus.rectangle.portrait")
                    Text("Add")
                }
            
            DecksView(isDarkMode: isDarkMode)
                .tabItem {
                    Image(systemName: "rectangle.stack.fill.badge.plus")
                    Text("Add")
                }
            
            InventoryView()
                .tabItem {
                    Image(systemName: "gym.bag.fill")
                    Text("Inventory")
                }
            
            AccountView(user: $user, isDarkMode: $isDarkMode)
                .tabItem {
                    Image(systemName: "person.crop.square")
                    Text("Account")
                }
            
        }
        .fullScreenCover(isPresented: !$user.isLoggedIn){
            LoginView(isLoggedIn: $user.isLoggedIn, username: $user.username, password: $user.password, signError: $user.signError, signingUp: $user.signingUp)
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    HomeView()
}


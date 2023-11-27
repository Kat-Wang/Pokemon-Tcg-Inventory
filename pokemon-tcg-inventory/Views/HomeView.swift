//
//  HomeView.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/25/23.
//

import SwiftUI

struct HomeView: View {
    
    //TODO: SET THIS VAR TO FALSE WHEN DONE TESTING HOME
    @State var isLoggedIn = true
    
    var body: some View {
        TabView {
            InventoryView()
                .tabItem {
                    Image(systemName: "gym.bag.fill")
                    Text("Inventory")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person.crop.square")
                    Text("Account")
                }
        }
        .fullScreenCover(isPresented: !$isLoggedIn){
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}

#Preview {
    HomeView()
}


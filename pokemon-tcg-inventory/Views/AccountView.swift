//
//  AccountView.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/26/23.
//

import SwiftUI

struct AccountView: View {
    @Binding var user: User
    @Binding var isDarkMode: Bool
    @Binding var soundEnabled: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Email/Username").font(Font.custom("Inter-Regular_Light", size: 12))) {
                    Text(user.username).font(Font.custom("Inter-Regular_Light", size: 16))
                }
                
                Section(header: Text("Display Name (feel free to change)").font(Font.custom("Inter-Regular_Light", size: 12))) {
                    TextField("", text: $user.displayName).font(Font.custom("Inter-Regular_Light", size: 16))
                }
                
                Section(header: Text("Preferences").font(Font.custom("Inter-Regular_Light", size: 12))){
                    Toggle("Dark Mode", isOn: $isDarkMode).font(Font.custom("Inter-Regular_Light", size: 16))
                }
                
                    Toggle("Sound On/Off", isOn: $soundEnabled).font(Font.custom("Inter-Regular_Light", size: 16))
                }
            }
            .navigationTitle("Account")
        }
    }
    


#Preview {
    AccountView(user: .constant(sampleUser), isDarkMode: .constant(false), soundEnabled: .constant(true))
}


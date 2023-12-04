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
                Section(header: Text("Email/Username")) {
                    Text(user.username)
                }
                
                Section(header: Text("Display Name (feel free to change)")) {
                    TextField("", text: $user.displayName)
                }
                
                Section(header: Text("Preferences")){
                    Toggle("Dark Mode", isOn: $isDarkMode)
                }
                
                    Toggle("Sound On/Off", isOn: $soundEnabled)
                }
            }
            .navigationTitle("Account")
        }
    }
    


#Preview {
    AccountView(user: .constant(sampleUser), isDarkMode: .constant(false), soundEnabled: .constant(true))
}


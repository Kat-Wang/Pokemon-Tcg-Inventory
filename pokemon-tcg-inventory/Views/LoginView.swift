//
//  ContentView.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/19/23.
//

import SwiftUI
import SwiftData
import CloudKit
import FirebaseAuth

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    
    @Binding var username: String
    @Binding var password: String
    @Binding var signError: Bool
    @Binding var signingUp: Bool
    
    var body: some View{
        ZStack{
            VStack{
                TitleLogo()
                
                SignIn(isLoggedIn: $isLoggedIn, username: $username, password: $password, signError: $signError)
                
                SignUpPrompt(signingUp: $signingUp, username: $username, password: $password)
            }
            .textFieldStyle(.roundedBorder)
            .alert("Sign In Failed", isPresented: $signError) {
                Button("OK") {
                    signError = false
                }
            } message: {
                Text("Something went wrong. Please double check all fields entered.")
            }
            .sheet(isPresented: $signingUp) {
                SignUpView(username: $username, password: $password, signError: $signError, signingUp: $signingUp, isLoggedIn: $isLoggedIn
                )
            }
        }
    }
}

#Preview {
    LoginView(isLoggedIn: .constant(false), username: .constant(""), password: .constant(""), signError: .constant(false), signingUp: .constant(false))
}






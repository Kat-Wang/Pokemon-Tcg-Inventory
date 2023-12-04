//
//  SignIn.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/25/23.
//

import SwiftUI
import FirebaseAuth

struct SignIn: View {
    
    @Binding var isLoggedIn: Bool
    @Binding var username: String
    @Binding var password: String
    @Binding var signError: Bool
    
    var body: some View {
        TextField("E-mail", text: $username)
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
            .frame(width: 240)
        
        SecureField("Password", text: $password)
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
            .frame(width: 240)
        
        Button {
            Auth.auth().signIn(withEmail: username, password: password) { result, error in
                if (error != nil) {
                    signError = true
                }
                else {
                    isLoggedIn = true
                }
            }
        } label: {
            Text("Sign In")
                .font(Font.custom("Inter-Regular_Light", size: 15))
        }
        .padding()
        .buttonStyle(.borderedProminent)
        .tint(Color(hex: "#4484b2"))
        .shadow(color: Color(hex: "#b2d1d4"), radius: 5)
    }
}

//
//  SignUpPrompt.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/25/23.
//

import SwiftUI

struct SignUpPrompt: View {
    @Binding var signingUp: Bool
    @Binding var username: String
    @Binding var password: String
    
    var body: some View {
        HStack{
            Text("Don't have an account?")
                .font(Font.custom("Inter-Regular_Light", size: 10))

            
            Button {
                username = ""
                password = ""
                signingUp = true
            } label: {
                Text("Sign up.")
                    .font(Font.custom("Inter-Regular_Light", size: 13))

            }
        }.font(.caption)
    }
}


//
//  SignUpFields.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/26/23.
//

import SwiftUI

struct SignupFields: View {
    
    @Binding var username: String
    @Binding var password: String
    @Binding var confirmPassword: String
    
    var body: some View {
        TextField("E-mail", text: $username)
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
            .frame(width: 240)
        
        SecureField("Password", text: $password)
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
            .frame(width: 240)
        
        SecureField("Re-confirm Password", text: $confirmPassword)
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
            .frame(width: 240)
    }
}

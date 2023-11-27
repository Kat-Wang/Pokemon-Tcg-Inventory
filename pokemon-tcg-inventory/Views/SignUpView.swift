//
//  SignUpView.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/24/23.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    @Binding var username: String
    @Binding var password: String
    @Binding var signError: Bool
    @Binding var signingUp: Bool
    @State var confirmPassword = ""
    @State var statusMsg = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button{
                    username = ""
                    password = ""
                    confirmPassword = ""
                    signingUp = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding()
            
            Group{
                Text("Create New Account")
                    .font(.title)
                
                SignupFields(username: $username, password: $password, confirmPassword: $confirmPassword)
                
                Text(statusMsg)
                    .foregroundColor(.red)
                
                Button {
                    if password == confirmPassword {
                        statusMsg = ""
                        
                        Auth.auth().createUser(withEmail: username, password: password) { result, error in
                            if (error != nil) {
                                signError = true
                            }
                            else {
                                signingUp = false
                                Auth.auth().signIn(withEmail: username, password: password)
                            }
                        }
                    }
                    else {
                        statusMsg = "Re-confirm password incorrect."
                    }
                } label: {
                    Text("Sign Up")
                }
                .buttonStyle(.borderedProminent)
                .tint(Color(hex: "#4484b2"))
                .shadow(color: Color(hex: "#b2d1d4"), radius: 5)
            }
            .padding(3)
        }
        .textFieldStyle(.roundedBorder)
        .alert("Sign Up Failed", isPresented: $signError) {
            Button("OK") {
                signError = false
            }
        } message: {
            Text("Something went wrong. Please double check all fields entered.")
        }
    }
}


#Preview {
    SignUpView(username: .constant("kate@gmail.com"), password: .constant("123123"), signError: .constant(true), signingUp: .constant(true))
}



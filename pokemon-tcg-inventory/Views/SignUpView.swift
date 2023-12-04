//
//  SignUpView.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/24/23.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    @State var confirmPassword = ""
    @State var statusMsg = ""
    
    @Binding var username: String
    @Binding var password: String
    @Binding var signError: Bool
    @Binding var signingUp: Bool
    @Binding var isLoggedIn: Bool

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
                    Image(systemName: "x.square")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding()
            
            Group{
                Text("Create New Account")
                    .font(Font.custom("Inter-Regular_Light", size: 28))

                
                SignupFields(username: $username, password: $password, confirmPassword: $confirmPassword)
                
                Text(statusMsg)
                    .foregroundColor(.red)
                
                Button {
                    if password == confirmPassword {
                        statusMsg = ""
                        
                        UserManager.shared.createUser(username: username, password: password) { error, loggedIn in
                            signError = error
                            isLoggedIn = loggedIn
                        }

                    }
                    else {
                        statusMsg = "Re-confirm password incorrect."
                    }
                } label: {
                    Text("Sign Up")
                        .font(Font.custom("Inter-Regular_Light", size: 15))
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
    SignUpView(username: .constant("kate@gmail.com"), password: .constant("123123"), signError: .constant(true), signingUp: .constant(true), isLoggedIn: .constant(false))
}



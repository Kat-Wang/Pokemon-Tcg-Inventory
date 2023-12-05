//
//  UserManager.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 12/2/23.
//

//FILE NOT IN USE; IN PLACE FOR FUTURE UPDATES ON THE APP//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

final class UserManager {
    
    static let shared = UserManager()
    
    private init() {}
    
    func createUser(username: String, password: String,completion: @escaping (Bool, Bool) -> Void) {
        
        var signError = false
        var isLoggedIn = false
        
        Auth.auth().createUser(withEmail: username, password: password) { result, error in
            if let error = error {
                signError = true
                print("Error creating user: \(error.localizedDescription)")
                completion(signError, isLoggedIn)
            } else {
                print("User created successfully")
                signError = false
                Auth.auth().signIn(withEmail: username, password: password) { _, signInError in
                    if let signInError = signInError {
                        signError = true
                        print("Error signing in: \(signInError.localizedDescription)")
                        completion(signError, isLoggedIn)
                    } else {
                        isLoggedIn = true
                        let ref = FirestoreManager.shared.db.collection("Users").document(username)
                        ref.setData(["username": username, "password": password]) { error in
                            if let error = error {
                                print("Error updating Firestore: \(error.localizedDescription)")
                            }
                            completion(signError, isLoggedIn)
                        }
                    }
                }
            }
        }
    }
    
    
    
}

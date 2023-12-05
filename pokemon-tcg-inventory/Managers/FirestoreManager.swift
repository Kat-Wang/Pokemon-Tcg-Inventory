//
//  FirestoreManager.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 12/2/23.
//

//FILE NOT IN USE; IN PLACE FOR FUTURE UPDATES ON THE APP//

import FirebaseFirestore

class FirestoreManager {
    static let shared = FirestoreManager()

    let db = Firestore.firestore()
}

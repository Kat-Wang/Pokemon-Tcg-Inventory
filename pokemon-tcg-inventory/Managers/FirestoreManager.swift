//
//  FirestoreManager.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 12/2/23.
//

import FirebaseFirestore

class FirestoreManager {
    static let shared = FirestoreManager()

    let db = Firestore.firestore()
}

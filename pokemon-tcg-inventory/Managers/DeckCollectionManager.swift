//
//  DeckCollectionManager.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 12/2/23.
//

//FILE NOT IN USE; IN PLACE FOR FUTURE UPDATES ON THE APP//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

final class DeckCollectionManager {
    
    static let shared = DeckCollectionManager()
    
    private init() {}
    
    func createDeckCollection(id: String, decks: [Deck]) {
        
        let ref = FirestoreManager.shared.db.collection("DeckCollection").document(id)
        ref.setData(["id": id, "decks": decks]) { error in
            if let error = error {
                print("Error updating Firestore: \(error.localizedDescription)")
            }
        }
        
    }
}

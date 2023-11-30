//
//  Alert.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/29/23.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidURL = AlertItem(title: Text("Server Error"), message: Text("Data received from the server was invalid."), dismissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response form the server."), dismissButton: .default(Text("OK")))
    static let invalidData = AlertItem(title: Text("Server Error"), message: Text("There was an issue connecting to the server."), dismissButton: .default(Text("OK")))
    static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Unable to complete your request at this time. Please check your internet connection."), dismissButton: .default(Text("OK")))
}

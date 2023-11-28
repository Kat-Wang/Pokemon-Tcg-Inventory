//
//  Card.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/26/23.
//

import Foundation

struct Card: Decodable {
    let id: String
    let name: String
    let imageUrl: String
    let supertype: String
    let subtype: String?
    let set: String
    let rarity: String
    let series: String
    let tcgPlayer: TCGPlayerInfo?
    // Add other properties as needed based on the API response
    
    enum CodingKeys: String, CodingKey {
        case id, name, imageUrl, supertype, subtype, set, rarity, series
        case tcgPlayer = "tcgplayer"
        // Map additional properties here
    }
}

struct TCGPlayerInfo: Decodable {
    let url: String
    let prices: Prices
    let isDirect: Bool
    // Add other TCGPlayer-related properties if needed
    
    enum CodingKeys: String, CodingKey {
        case url, prices, isDirect
        // Map additional properties here
    }
}

struct Prices: Decodable {
    let normal: PriceDetails
    let holofoil: PriceDetails
    // Add other price details if needed
    
    enum CodingKeys: String, CodingKey {
        case normal, holofoil
        // Map additional price keys here
    }
}

struct PriceDetails: Decodable {
    let market: Double
    let low: Double
    let mid: Double
    let high: Double
    // Add other price details if needed
    
    enum CodingKeys: String, CodingKey {
        case market, low, mid, high
        // Map additional price detail keys here
    }
}

//
//  Card.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/26/23.
//

import Foundation

struct Card: Decodable, Identifiable {
    let id: String
    let name: String
    let images: Images?
    let supertype: String?
    let subtypes: [String]?
    let level: String?
    let hp: String?
    let types: [String]?
    let abilities: [Ability]?
    
}

struct Ability: Decodable {
    let name: String
    let text: String
    let type: String
}

struct Images: Decodable {
    let small: String
    let large: String
}

struct CardResponse : Decodable {
    let data: [Card]
    let page: Int
    let pageSize: Int
    let count: Int
    let totalCount: Int
}

//struct CardResponse: Decodable {
//    let data: [Card]
//    
//    enum CodingKeys: String, CodingKey {
//        case data
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        data = try container.decode([Card].self, forKey: .data)
//    }
//}

struct MockData {
    static let sampleAbilities = Ability(name: "Fake Ability", text: "This is a fake ability", type: "Ability")
    
    static let sampleImages = Images(small: "https://images.pokemontcg.io/xy1/1.png", large: "https://images.pokemontcg.io/xy1/1_hires.png")
    
    static let sampleCard = Card(id: "xy1-1",
                                 name: "Venusaur-EX",
                                 images: sampleImages,
                                 supertype: "Pokemon",
                                 subtypes: ["Basic", "EX"],
                                 level: nil,
                                 hp: "100",
                                 types: ["Grass"],
                                 abilities: [sampleAbilities])
}

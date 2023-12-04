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
    let `set`: Set?
    
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

struct Set: Decodable {
    let id: String
    let name: String
    let series: String
}

struct CardResponse : Decodable {
    let data: [Card]
    let page: Int
    let pageSize: Int
    let count: Int
    let totalCount: Int
}

struct MockData {
    static let sampleAbilities = Ability(name: "Fake Ability", text: "This is a fake ability", type: "Ability")
    
    static let sampleImages = Images(small: "https://images.pokemontcg.io/xy1/1.png", large: "https://images.pokemontcg.io/xy1/1_hires.png")
    
    static let sampleSet = Set(id: "000", name: "Sword & Shield", series: "155")
    
    static let samplePokemonCard = Card(id: "xy1-1",
                                 name: "Venusaur-EX",
                                 images: sampleImages,
                                 supertype: "Pokemon",
                                 subtypes: ["Basic", "EX"],
                                 level: nil,
                                 hp: "100",
                                 types: ["Grass"],
                                 abilities: [sampleAbilities],
                                 set: sampleSet
    )
    
    static let sampleTrainerCard = Card(id: "ducky",
                                        name: "Nessa",
                                        images: sampleImages,
                                        supertype: "Trainer",
                                        subtypes: ["Basic", "EX"],
                                        level: nil,
                                        hp: "100",
                                        types: ["Grass"],
                                        abilities: [sampleAbilities],
                                        set: sampleSet
    )
    
    static let sampleEnergyCard = Card(id: "abc",
                                        name: "Fire Energy",
                                        images: sampleImages,
                                        supertype: "Energy",
                                        subtypes: ["Basic", "EX"],
                                        level: nil,
                                        hp: "100",
                                        types: ["Grass"],
                                        abilities: [sampleAbilities],
                                        set: sampleSet
    )
    
    static let sampleEnergyCard2 = Card(id: "def",
                                        name: "Water Energy",
                                        images: sampleImages,
                                        supertype: "Energy",
                                        subtypes: ["Basic", "EX"],
                                        level: nil,
                                        hp: "100",
                                        types: ["Grass"],
                                        abilities: [sampleAbilities],
                                        set: sampleSet
    )
}

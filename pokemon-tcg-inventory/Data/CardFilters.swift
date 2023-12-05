//
//  CardFilters.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/27/23.
//

import Foundation
import SwiftUI

@Observable
class CardFilters {
    var stageFilters = ["basic", "stage1", "stage2", "vmax", "vstar", "vunion", "mega", "_break", "restored", "legend"]
    var stageFilterNames = ["Basic", "Stage 1", "Stage 2", "VMAX", "STAR", "V-UNION", "Mega", "Break", "Restored", "Legend"]
    
    var mechanicFilters = ["ex", "v", "gx", "ex", "radiant", "prismstar", "acespec", "vunion", "star"]
    var mechanicFilterNames = ["EX", "V", "GX", "Radiant", "Prism Star", "Ace Spec", "V-UNION", "Star"]
    
    var typeFilters = ["grass", "fire", "water", "lightning", "psychic", "fighting", "darkness", "metal", "fairy", "dragon", "colorless"]
    var typeFilterNames = ["Grass", "Fire", "Water", "Lightning", "Psychic", "Fighting", "Darkness", "Metal", "Fairy", "Dragon", "Colorless"]
    
    var labelFilters = ["fusionstrike", "singlestrike", "rapidstrike", "tagteam", "ultrabeast", "teamplasma"]
    var labelFilterNames = ["Fusion Strike", "Single Strike", "Rapid Strike", "Tag Team", "Ultra Beast", "Team Plasma"]

    var extraFilters = ["ability", "ancienttrait", "baby"]
    var extraFilterNames = ["Ability", "Ancient Trait", "Baby"]
    
    var trainerFilters = ["item", "supporter", "stadium", "tool"]
    var trainerFilterNames = ["Item", "Supporter", "Stadium", "Tool"]
    
    var energyFilters = ["basicenergy", "specialenergy"]
    var energyFilterNames = ["Basic", "Special"]
    
    var sortingFilters = ["sortName", "sortHP", "sortCode", "sortType", "sortAsc", "sortDesc"]
    var sortingFilterNames = ["Name", "HP", "Code", "Type", "Sort Asc", "Sort Desc"]
    
    var formatFilters = ["standard", "expanded", "unlimited"]
    var formatFilterNames = ["Standard", "Expanded", "Unlimited"]

    var filters = [
        "pokemon": false,
        "trainer": false,
        "energy": false,
        "basic": false,
        "stage1": false,
        "stage2": false,
        "mega": false,
        "_break": false,
        "vmax": false,
        "vstar": false,
        "vunion": false,
        "restored": false,
        "legend": false,
        "ex": false,
        "v": false,
        "gx": false,
        "radiant": false,
        "star": false,
        "prismstar": false,
        "acespec": false,
        "grass": false,
        "fire": false,
        "water": false,
        "lightning": false,
        "psychic": false,
        "fighting": false,
        "darkness": false,
        "metal": false,
        "fairy": false,
        "dragon": false,
        "colorless": false,
        "fusionstrike": false,
        "singlestrike": false,
        "rapidstrike": false,
        "tagteam": false,
        "ultrabeast": false,
        "teamplasma": false,
        "ability": false,
        "ancienttrait": false,
        "baby": false,
        "item": false,
        "supporter": false,
        "stadium": false,
        "tool": false,
        "basicenergy": false,
        "specialenergy": false,
        "sortName": false,
        "sortHP": false,
        "sortCode": false,
        "sortType": false,
        "sortAsc": false,
        "sortDesc": false,
        "standard": false,
        "expanded": false,
        "unlimited": false
    ]

    var filterQueries = [
        "pokemon": "supertype:pokemon%20",
        "trainer": "supertype:trainer%20",
        "energy": "supertype:energy%20",
        "basic": "subtypes:basic%20",
        "stage1": "subtypes:%22stage%201%22%20",
        "stage2": "subtypes:%22stage%202%22%20",
        "mega": "subtypes:mega%20",
        "_break": "subtypes:break%20",
        "vmax": "subtypes:vmax%20",
        "vstar": "subtypes:vstar%20",
        "vunion": "subtypes:v-union%20",
        "restored": "subtypes:restored%20",
        "legend": "subtypes:legend%20",
        "ex": "subtypes:ex%20",
        "v": "subtypes:v%20",
        "gx": "subtypes:gx%20",
        "radiant": "subtypes:radiant%20",
        "prismstar": "subtypes:prism%20",
        "star": "!subtypes:star%20",
        "acespec": "subtypes:%22ace%20spec%22%20",
        "grass": "types:grass%20",
        "fire": "types:fire%20",
        "water": "types:water%20",
        "lightning": "types:lightning%20",
        "psychic": "types:psychic%20",
        "fighting": "types:fighting%20",
        "darkness": "types:darkness%20",
        "metal": "types:metal%20",
        "fairy": "types:fairy%20",
        "dragon": "types:dragon%20",
        "colorless": "types:colorless%20",
        "fusionstrike": "subtypes:%22fusion%20strike%22%20",
        "singlestrike": "subtypes:%22single%20strike%22%20",
        "rapidstrike": "subtypes:%22rapid%20strike%22%20",
        "tagteam": "subtypes:%22tag%20team%22%20",
        "ultrabeast": "subtypes:%22ultra%20beast%22%20",
        "teamplasma": "subtypes:%22team%20plasma%22%20",
        "ability": "abilities.text:*%20",
        "ancienttrait": "subtypes:ancientTrait.text:*%20",
        "baby": "subtypes:baby%20",
        "item": "subtypes:item%20",
        "supporter": "subtypes:supporter%20",
        "stadium": "subtypes:stadium%20",
        "tool": "subtypes:tool%20",
        "basicenergy": "subtypes:basic%20",
        "specialenergy": "subtypes:special%20",
        "sortName": "subtypes:sortName",
        "sortHP": "subtypes:sortHP",
        "sortCode": "subtypes:sortCode",
        "sortType": "subtypes:sortType",
        "sortAsc": "subtypes:sortAsc",
        "sortDesc": "subtypes:sortDesc",
        "standard": "subtypes:standard",
        "expanded": "subtypes:expanded",
        "unlimited": "subtypesunlimited"
    ]
}

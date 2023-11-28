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
    var stageFilterNames = ["basic", "stage1", "stage2", "vmax", "vstar", "vunion", "mega", "_break", "restored", "legend"]
    var mechanicFilterNames = ["ex", "v", "gx", "ex", "radiant", "prismstar", "acespec", "vunion"]
    var typeFilterNames = ["grass", "fire", "water", "lightning", "psychic", "fighting", "darkness", "metal", "fairy", "dragon", "colorless"]
    var labelFilterNames = ["fusionstrike", "singlestrike", "rapidstrike", "tagteam", "ultrabeast", "teamplasma"]
    var extraFilterNames = ["ability", "ancienttrait", "baby"]
    var trainerFilterNames = ["item", "supporter", "stadium", "tool"]
    var energyFilterNmaes = ["basicenergy", "specialenergy"]
    var sortingFilterNames = ["sortName", "sortHP", "sortCode", "sortType", "sortAsc", "sortDesc"]
    var formatFilterNames = ["standard", "expanded", "unlimited"]
    
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
}

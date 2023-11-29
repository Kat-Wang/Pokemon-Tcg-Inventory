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
    
    var mechanicFilters = ["ex", "v", "gx", "ex", "radiant", "prismstar", "acespec", "vunion"]
    var mechanicFilterNames = ["EX", "V", "GX", "Radiant", "Prism Star", "Ace Spec", "V-UNION"]
    
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

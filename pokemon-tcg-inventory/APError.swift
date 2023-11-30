//
//  APError.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/29/23.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

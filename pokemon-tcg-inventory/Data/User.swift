//
//  User.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/27/23.
//

import Foundation
import SwiftUI


@Observable
class User {
    //TODO: SET THIS VAR TO FALSE WHEN DONE TESTING HOME
    var isLoggedIn = true
    var username: String = ""
    var password: String = ""
    var signError = false
    var signingUp = false
    var displayName = "Trainer"
}


var sampleUser = User()

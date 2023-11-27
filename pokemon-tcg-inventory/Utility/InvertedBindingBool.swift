//
//  InvertedBindingBool.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/26/23.
//

import Foundation
import SwiftUI

prefix func ! (value: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { !value.wrappedValue },
        set: { value.wrappedValue = !$0 }
    )
}

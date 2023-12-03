//
//  SearchBar.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 12/2/23.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchField: String
    var isDarkMode: Bool
    
    var body: some View {
        Rectangle()
            .stroke(Color(isDarkMode ? .white : .black), lineWidth: 1)
            .frame(width: 330, height: 40)
            .overlay(
                TextField("search cards", text: $searchField)
                    .font(Font.custom("Inter-Regular_Light", size: 15))
                    .padding([.leading, .trailing], 8)
                    .autocorrectionDisabled()
            )
            .padding([.leading, .trailing, .bottom])
    }
}


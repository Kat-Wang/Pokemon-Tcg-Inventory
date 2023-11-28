//
//  TitleLogo.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/25/23.
//

import SwiftUI

struct TitleLogo: View {
    var body: some View {
        Text("Pokemon TCG\nInventory App").bold().font(.largeTitle)
        
        Image("pip")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 240, height: 240)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .padding(.bottom)
    }
}

#Preview {
    TitleLogo()
}

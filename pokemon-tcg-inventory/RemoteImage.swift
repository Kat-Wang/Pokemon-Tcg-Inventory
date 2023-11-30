//
//  RemoteImage.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/29/23.
//

import Foundation
import SwiftUI

final class ImageLoader: ObservableObject{
    
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString){ uiImage in
            guard let uiImage = uiImage else {return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
    
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("PokemonImages/pikasuprise").resizable()
    }
}

//this image is what we're gonna use on list view to replace the placeholder, when this appears on screen we call imageLoader.load
struct CardRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {imageLoader.load(fromURLString: urlString)}
    }
}

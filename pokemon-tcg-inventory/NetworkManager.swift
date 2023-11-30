//
//  NetworkManager.swift
//  pokemon-tcg-inventory
//
//  Created by Kate Wang on 11/29/23.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    let apiKey = Bundle.main.object(forInfoDictionaryKey: "PokemonTCGApiKey")
        
    static let baseURL = "https://api.pokemontcg.io/v2/cards?page=1&pageSize=5"
    
    private let cardURL = baseURL + ""
    
    private init() {}
    
    //need to write 2 func - get appetizers and download images
    
    //returns an array of appetizers
    func getCards(with filters: CardFilters, completed: @escaping (Result<[Card], APError>) -> Void){
        guard let apiKey = apiKey as? String, let url = URL(string: cardURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "X-Api-Key")

        
        //if we get good url, we create a network request
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            //200 is the things went good html code
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            //if we get past all the checks, we can do stuff with the data
            
            do {
//                print(String(data: data, encoding: .utf8)!)
                let decoder = JSONDecoder()
                //from our data we have, decode that into an AppetizerResponse (which is an array of appetizer json objects)
                let decodedResponse = try decoder.decode(CardResponse.self, from: data)
                //getting request because thats how our AppetizerResponse was structured
                completed(.success(decodedResponse.data))
            } catch {
//                print("Decoding error:", error)
                completed(.failure(.invalidData))
            }
        }
        //fires off the network call
        task.resume()
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        //if we get an image
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        //if not in cache, we go download the image
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
            //if have good data, then create image from data
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            //since this image isn't in the cache yet, we put it in
            self.cache.setObject(image, forKey: cacheKey)
            
            completed(image)
        }
        //fires off the network call
        task.resume()
    }
    
}

//
//  Service.swift
//  bbtbilisim
//
//  Created by Doğancan Mavideniz on 28.11.2023.
//

import Foundation

class RickAndMortyService {
    func fetchCharacters(completion: @escaping (Character) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Character.self, from: data) {
                    DispatchQueue.main.async {
                        completion(decodedResponse)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

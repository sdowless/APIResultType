//
//  APIClient.swift
//  APIResultType
//
//  Created by Stephen Dowless on 4/4/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import Foundation

struct APIClient {
    static let shared = APIClient()
    let base_url = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    func fetchData(completion: @escaping([Pokemon]?, Error?) -> ()) {
        guard let url = URL(string: base_url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // handle error
            if let error = error {
                print("Failed to fetch data with error: ", error)
                completion(nil, error)
                return
            }
            
            // parse data
            guard let data = data?.parseData(removeString: "null,") else { return }
            
            // decode data
            do {
                let pokemon = try JSONDecoder().decode([Pokemon].self, from: data)
                print(pokemon[0].evolutionChain as Any)
                completion(pokemon, nil)
            } catch let error {
                print("Failed to create json with error: ", error.localizedDescription)
                completion(nil, error)
            }
            
        }.resume()
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}

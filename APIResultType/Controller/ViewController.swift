//
//  ViewController.swift
//  APIResultType
//
//  Created by Stephen Dowless on 4/4/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var pokemon = [Pokemon]()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPokemon()
        
    }

    // MARK: - API
    
    func fetchPokemon() {
        
        APIClient.shared.fetchData { (result) in
            switch result {
            case .success(let pokemon):
                self.pokemon = pokemon
            case .failure(let error):
                print("DEBUG: Failed with error \(error)")
            }
        }

        
//        APIClient.shared.fetchData { (pokemon, error) in
//            if let error = error {
//                print("DEBUG: Failed with error \(error)")
//                return
//            }
//
//            guard let pokemon = pokemon else { return }
//            print("DEBUG: Pokemon array -> \(pokemon)")
//            self.pokemon = pokemon
//        }
    }
}


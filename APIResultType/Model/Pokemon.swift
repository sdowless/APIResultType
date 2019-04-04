//
//  Pokemon.swift
//  APIResultType
//
//  Created by Stephen Dowless on 4/4/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

struct Pokemon: Decodable {
    let name: String?
    let imageUrl: String?
    let description: String?
    let height: Int?
    let weight: Int?
    let attack: Int?
    let type: String?
    let evolutionChain: [EvolutionChain]?
}

struct EvolutionChain: Decodable {
    let id: String?
    let name: String?
}

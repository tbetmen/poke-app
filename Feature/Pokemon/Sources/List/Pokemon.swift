//
//  Pokemon.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Common
import Foundation

public protocol PokemonInterface {
    var id: Int { get }
    var name: String { get }
    var height: Int { get }
    var weight: Int { get }
    var imageURL: String { get }
    var moves: [String] { get }
    var types: [String] { get }
}

class Pokemon: Identifiable, PokemonInterface {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let imageURL: String
    let moves: [String]
    let types: [String]
    
    init() {
        self.id = 0
        self.name = "pikachu"
        self.height = 1
        self.weight = 6
        self.imageURL = ""
        self.moves = []
        self.types = []
    }

    init(
        id: Int,
        name: String,
        height: Int,
        weight: Int,
        imageURL: String,
        moves: [String],
        types: [String]
    ) {
        self.id = id
        self.name = name
        self.height = height
        self.weight = weight
        self.imageURL = imageURL
        self.moves = moves
        self.types = types
    }
}

extension Pokemon {
    func toLocalPokemon(nickname: String) -> LocalPokemon {
        return LocalPokemon(
            id: id,
            name: name,
            nickname: nickname,
            imageURL: imageURL
        )
    }
}

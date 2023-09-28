//
//  PokemonRouting.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Foundation

public protocol PokemonRouting {
    func navigateToDetail(pokemon: PokemonInterface)
    func navigateToMyPokemon()
}

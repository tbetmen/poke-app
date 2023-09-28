//
//  LocalPokemonStorage.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Foundation

public protocol LocalPokemonStorable {
    func save(pokemons: [LocalPokemon])
    func get() -> [LocalPokemon]
}

public class LocalPokemonStorage: LocalPokemonStorable {
    private let KEY = "mypokemon"
    private let userDefaults: UserDefaults

    public init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    public func save(pokemons: [LocalPokemon]) {
        do {
            let encodedData = try JSONEncoder().encode(pokemons)
            userDefaults.set(encodedData, forKey: KEY)
        } catch {
            print("Failed to encode LocalPokemon to Data.")
        }
    }
    
    public func get() -> [LocalPokemon] {
        guard let datas = userDefaults.object(forKey: KEY) as? Data
        else { return [] }

        do {
            let pokemons = try JSONDecoder().decode([LocalPokemon].self, from: datas)
            return pokemons
        } catch {
            print("Failed to decode Data to LocalPokemon.")
            return []
        }
    }
}

//
//  APIConfig.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Foundation

public enum APIConfig {
    public enum PokeAPI {
        public static func pokemon(id: Int) -> String {
            return "https://pokeapi.co/api/v2/pokemon/\(id)"
        }
    }
    public enum Localhost {
        public static let catchPokemon = "http://localhost:3000/catch"
        public static let releasePokemon = "http://localhost:3000/release"
        public static let renamePokemon = "http://localhost:3000/rename"
    }
}

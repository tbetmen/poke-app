//
//  PokeCatchEndpoint.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Common
import Foundation

struct PokeCatchEndpoint {
    static func get() -> APIEndpoint<PokeCatchResponseDTO> {
        return APIEndpoint(
            path: APIConfig.Localhost.catchPokemon,
            useBaseURL: false,
            method: .get
        )
    }
}

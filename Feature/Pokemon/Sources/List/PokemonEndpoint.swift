//
//  PokemonEndpoint.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Common
import Foundation

struct PokemonEndpoint {
    static func getDetail(with id: Int) -> APIEndpoint<PokemonResponseDTO> {
        return APIEndpoint(
            path: APIConfig.PokeAPI.pokemon(id: id),
            useBaseURL: false,
            method: .get
        )
    }
}

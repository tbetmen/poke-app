//
//  PokeEndpoint.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Common
import Foundation

struct PokeEndpoint {
    static func release(
        with currentName: String
    ) -> APIEndpoint<PokeReleaseResponseDTO> {
        return APIEndpoint(
            path: APIConfig.Localhost.releasePokemon,
            useBaseURL: false,
            method: .post,
            headers: ["Content-Type": "application/json"],
            bodyParametersEncodable: PokePostRequestDTO(currentName: currentName)
        )
    }

    static func rename(
        with currentName: String
    ) -> APIEndpoint<PokeRenameResponseDTO> {
        return APIEndpoint(
            path: APIConfig.Localhost.renamePokemon,
            useBaseURL: false,
            method: .post,
            headers: ["Content-Type": "application/json"],
            bodyParametersEncodable: PokePostRequestDTO(currentName: currentName)
        )
    }
}

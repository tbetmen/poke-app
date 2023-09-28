//
//  PokemonResponseDTO.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Foundation

// MARK: - DTO

struct PokemonResponseDTO: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let sprites: SpriteDTO
    let moves: [MoveDTO]
    let types: [TypeDTO]
}

extension PokemonResponseDTO {
    struct SpriteDTO: Decodable {
        let other: OtherDTO
    }

    struct OtherDTO: Decodable {
        let officialArtwork: OfficialArtworkDTO
        
        private enum CodingKeys: String, CodingKey {
            case officialArtwork = "official-artwork"
        }
    }
    
    struct OfficialArtworkDTO: Decodable {
        let frontDefault: String
        
        private enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
        }
    }
}

extension PokemonResponseDTO {
    struct MoveDTO: Decodable {
        let move: MoveInnerDTO
    }
    
    struct MoveInnerDTO: Decodable {
        let name: String
    }
}

extension PokemonResponseDTO {
    struct TypeDTO: Decodable {
        let type: TypeInnerDTO
    }
    
    struct TypeInnerDTO: Decodable {
        let name: String
    }
}

// MARK: - Mapping to Entity

extension PokemonResponseDTO {
    func toEntity() -> Pokemon {
        return .init(
            id: id,
            name: name,
            height: height,
            weight: weight,
            imageURL: sprites.other.officialArtwork.frontDefault,
            moves: moves.map { $0.move.name },
            types: types.map { $0.type.name }
        )
    }
}

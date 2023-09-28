//
//  PokemonService.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Common
import Foundation

protocol PokemonServiceInterface {
    func fetchPokemonList(
        pokemonId: Int,
        completion: @escaping (Result<Pokemon, Error>) -> Void
    ) -> APIServiceCancellableInterface?
}

final class PokemonService: PokemonServiceInterface {
    private let transferService: DataTransferServiceInterface
    
    init(transferService: DataTransferServiceInterface = DataTransferService()) {
        self.transferService = transferService
    }
    
    func fetchPokemonList(
        pokemonId: Int,
        completion: @escaping (Result<Pokemon, Error>) -> Void
    ) -> APIServiceCancellableInterface? {
        let endpoint = PokemonEndpoint.getDetail(with: pokemonId)
        let task = self.transferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO.toEntity()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task
    }
}

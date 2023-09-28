//
//  PokeCatchService.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Common
import Foundation

protocol PokeCatchServiceInterface {
    func catchPokemon(
        completion: @escaping (Result<Bool, Error>) -> Void
    ) -> APIServiceCancellableInterface?
}

final class PokeCatchService: PokeCatchServiceInterface {
    private let transferService: DataTransferServiceInterface
    
    init(transferService: DataTransferServiceInterface = DataTransferService()) {
        self.transferService = transferService
    }
    
    func catchPokemon(
        completion: @escaping (Result<Bool, Error>) -> Void
    ) -> APIServiceCancellableInterface? {
        let endpoint = PokeCatchEndpoint.get()
        let task = self.transferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO.data.status))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task
    }
}

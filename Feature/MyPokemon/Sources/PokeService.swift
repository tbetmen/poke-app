//
//  PokeService.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Common
import Foundation

protocol PokeServiceInterface {
    func release(
        currentName: String,
        completion: @escaping (Result<(Int, Bool), Error>) -> Void
    ) -> APIServiceCancellableInterface?

    func rename(
        currentName: String,
        completion: @escaping (Result<(String, Bool), Error>) -> Void
    ) -> APIServiceCancellableInterface?
}

final class PokeService: PokeServiceInterface {
    private let transferService: DataTransferServiceInterface
    
    init(transferService: DataTransferServiceInterface = DataTransferService()) {
        self.transferService = transferService
    }
    
    func release(
        currentName: String,
        completion: @escaping (Result<(Int, Bool), Error>) -> Void
    ) -> APIServiceCancellableInterface? {
        let endpoint = PokeEndpoint.release(with: currentName)
        let task = self.transferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success((responseDTO.data.number, responseDTO.data.status)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task
    }
    
    func rename(
        currentName: String,
        completion: @escaping (Result<(String, Bool), Error>) -> Void
    ) -> APIServiceCancellableInterface? {
        let endpoint = PokeEndpoint.rename(with: currentName)
        let task = self.transferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success((responseDTO.data.name, responseDTO.data.status)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task
    }
}

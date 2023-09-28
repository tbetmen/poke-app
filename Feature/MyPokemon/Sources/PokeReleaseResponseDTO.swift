//
//  PokeReleaseResponseDTO.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Foundation

struct PokeReleaseResponseDTO: Decodable {
    let data: DataDTO
    
    struct DataDTO: Decodable {
        let number: Int
        let status: Bool
    }
}

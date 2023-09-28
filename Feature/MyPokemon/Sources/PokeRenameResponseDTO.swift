//
//  PokeRenameResponseDTO.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Foundation

struct PokeRenameResponseDTO: Decodable {
    let data: DataDTO
    
    struct DataDTO: Decodable {
        let name: String
        let status: Bool
    }
}

//
//  PokePostRequestDTO.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Foundation

struct PokePostRequestDTO: Encodable {
    let currentName: String
    
    private enum CodingKeys: String, CodingKey {
        case currentName = "current_name"
    }
}

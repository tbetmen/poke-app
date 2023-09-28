//
//  LocalPokemon.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Foundation

public struct LocalPokemon: Identifiable, Codable {
    public let id: Int
    public let name: String
    public var nickname: String
    public let imageURL: String
    
    public init(id: Int, name: String, nickname: String, imageURL: String) {
        self.id = id
        self.name = name
        self.nickname = nickname
        self.imageURL = imageURL
    }
}

//
//  APIServiceConfig.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Foundation

public protocol APIServiceConfigInterface {
    var baseURL: String { get }
    var headers: [String: String] { get }
    var queryParams: [String: String] { get }
}

public struct APIServiceConfig: APIServiceConfigInterface {
    public let baseURL: String
    public let headers: [String: String]
    public let queryParams: [String: String]
    
    public init(
        baseURL: String,
        headers: [String: String] = [:],
        queryParams: [String: String] = [:]
    ) {
        self.baseURL = baseURL
        self.headers = headers
        self.queryParams = queryParams
    }
}

public extension APIServiceConfig {
    static func create() -> APIServiceConfig {
        APIServiceConfig(
            baseURL: APIConfig.PokeAPI.pokemon(id: 1)
        )
    }
}

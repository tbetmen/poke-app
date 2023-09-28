//
//  PokemonListViewModel.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Common
import Foundation

protocol PokemonListViewModelInterface: ObservableObject {
    var pokemonList: [Pokemon] { get set }
    
    func loadPokemonList()
    func navigateToMyPokemon()
    func navigateToDetail(pokemon: Pokemon)
}

class PokemonListViewModel: PokemonListViewModelInterface {
    @Published var pokemonList: [Pokemon] = []

    private let router: PokemonRouting?
    private let service: PokemonServiceInterface
    
    init(
        router: PokemonRouting? = nil,
        service: PokemonServiceInterface = PokemonService()
    ) {
        self.router = router
        self.service = service
    }

    func loadPokemonList() {
        if !pokemonList.isEmpty { return }

        for id in 1...10 {
            _ = service.fetchPokemonList(pokemonId: id) { [weak self] result in
                switch result {
                case .success(let pokemon):
                    self?.pokemonList.append(pokemon)
                case .failure:()
                }
            }
        }
    }
    
    func navigateToMyPokemon() {
        router?.navigateToMyPokemon()
    }

    func navigateToDetail(pokemon: Pokemon) {
        router?.navigateToDetail(pokemon: pokemon)
    }
}

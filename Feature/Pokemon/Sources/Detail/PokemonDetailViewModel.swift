//
//  PokemonDetailViewModel.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Common
import Foundation

protocol PokemonDetailViewModelInterface: ObservableObject {
    var pokemon: Pokemon { get set }
    var localPokemonList: [LocalPokemon] { get set }
    var isCatchSuccess: Bool { get set }
    var isShowCatchDialog: Bool { get set }
    var isShowSaveDialog: Bool { get set }
    var isLoading: Bool { get set }
    var nickname: String { get set }

    var typesFormatted: String { get }
    var movesFormatted: String { get }
    var catchMessage: String { get }
    var saveMessage: String { get }

    func catchPokemon()
    func savePokemon()
}

final class PokemonDetailViewModel: PokemonDetailViewModelInterface {
    @Published var pokemon: Pokemon
    @Published var localPokemonList: [LocalPokemon] = []
    @Published var isCatchSuccess: Bool = false
    @Published var isShowCatchDialog: Bool = false
    @Published var isShowSaveDialog: Bool = false
    @Published var isLoading: Bool = false
    @Published var nickname: String = ""
    @Published var saveMessage: String = ""

    var typesFormatted: String {
        pokemon.types.joined(separator: ",")
    }
    var movesFormatted: String {
        pokemon.moves.joined(separator: ",")
    }
    var catchMessage: String {
        isCatchSuccess ? "Successfully catch \(pokemon.name)" : "Missed, please try again!"
    }

    private let service: PokeCatchServiceInterface
    private let storage: LocalPokemonStorable

    init(
        pokemon: Pokemon,
        service: PokeCatchServiceInterface = PokeCatchService(),
        storage: LocalPokemonStorable = LocalPokemonStorage()
    ) {
        self.pokemon = pokemon
        self.service = service
        self.storage = storage

        localPokemonList = storage.get()
        isCatchSuccess = localPokemonList.contains(where: { $0.id == pokemon.id })
    }

    func catchPokemon() {
        isLoading = true
        _ = service.catchPokemon { [weak self] result in
            switch result {
            case .success(let success):
                self?.isCatchSuccess = success
            case .failure:
                self?.isCatchSuccess = false
            }
            self?.isLoading = false
            self?.isShowCatchDialog = true
        }
    }
    
    func savePokemon() {
        if !isCatchSuccess {
            return
        }

        isLoading = true

        print("pokemons before: \(localPokemonList)")
        guard
            !localPokemonList.contains(where: {
                $0.nickname.lowercased().contains(nickname.lowercased()) &&
                $0.id == pokemon.id
            })
        else {
            saveMessage = "Pokemon already exist"
            isShowSaveDialog = true
            isLoading = false
            return
        }
        
        localPokemonList.append(pokemon.toLocalPokemon(nickname: nickname))
        storage.save(pokemons: localPokemonList)
        saveMessage = "Pokeman saved!"
        isShowSaveDialog = true
        isLoading = false
        print("pokemons after: \(localPokemonList)")
    }
}

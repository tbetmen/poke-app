//
//  MyPokemonViewModel.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Common
import Foundation

protocol MyPokemonViewModelInterface: ObservableObject {
    var localPokemonList: [LocalPokemon] { get set }
    var isShownReleaseDialog: Bool { get set }
    var isShownRenameDialog: Bool { get set }
    var renameStatus: Bool { get set }
    var renameMessage: String { get }
    var releaseStatus: Bool { get set }
    var releaseMessage: String { get }
    
    func loadPokemon()
    func renamePokemon(currentName: String)
    func releasePokemon(currentName: String)
}

final class MyPokemonViewModel: MyPokemonViewModelInterface {
    @Published var localPokemonList: [LocalPokemon] = []
    @Published var isShownReleaseDialog: Bool = false
    @Published var isShownRenameDialog: Bool = false
    @Published var renameStatus: Bool = false
    @Published var releaseStatus: Bool = false
    
    var renameMessage: String {
        renameStatus ? "Successfully rename" : "Failed, try again!"
    }
    var releaseMessage: String {
        releaseStatus ? "Successfully release" : "Failed, try again!"
    }
    
    private let service: PokeServiceInterface
    private let storage: LocalPokemonStorable

    init(
        service: PokeServiceInterface = PokeService(),
        storage: LocalPokemonStorable = LocalPokemonStorage()
    ) {
        self.service = service
        self.storage = storage
    }
    
    func loadPokemon() {
        localPokemonList = storage.get()
    }

    func renamePokemon(currentName: String) {
        _ = service.rename(currentName: currentName) { [weak self] result in
            switch result {
            case .success(let data):
                self?.renameStatus = data.1
                self?.renameInLocalPokemon(from: currentName, to: data.0)
            case .failure:
                self?.renameStatus = false
            }
            self?.isShownRenameDialog = true
        }
    }
    
    func releasePokemon(currentName: String) {
        _ = service.release(currentName: currentName) { [weak self] result in
            switch result {
            case .success(let data):
                self?.releaseStatus = data.1
                self?.removeFromLocalPokemon(of: currentName)
            case .failure:
                self?.releaseStatus = false
            }
            self?.isShownReleaseDialog = true
        }
    }
    
    private func removeFromLocalPokemon(of currentName: String) {
        if releaseStatus {
            localPokemonList.removeAll(where: { $0.nickname == currentName })
            updatePokemon()
        }
    }

    private func renameInLocalPokemon(from currentName: String, to newName: String) {
        if let index = localPokemonList.firstIndex(where: { $0.nickname == currentName }) {
            localPokemonList[index].nickname = newName
            updatePokemon()
        }
    }

    private func updatePokemon() {
        storage.save(pokemons: localPokemonList)
        loadPokemon()
    }
}

//
//  PokemonCoordinator.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Foundation
import Stinsen
import SwiftUI
import FeatureMyPokemon
import FeaturePokemon

final class PokemonCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \PokemonCoordinator.list)
    
    @Root var list = makeList
    @Route(.push) var detail = makeDetail
    @Route(.push) var mypokemon = makeMyPokemon
}

extension PokemonCoordinator {
    @ViewBuilder
    private func makeList() -> some View {
        PokemonScreenFactory.createList(router: PokemonRouter())
    }

    @ViewBuilder
    private func makeDetail(pokemon: PokemonInterface) -> some View {
        PokemonScreenFactory.createDetail(pokemon: pokemon)
    }

    @ViewBuilder
    private func makeMyPokemon() -> some View {
        MyPokemonScreenFactory.createMyPokemon()
    }
}

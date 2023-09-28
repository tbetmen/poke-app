//
//  PokemonScreenFactory.swift
//  FeaturePokemon
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import SwiftUI

public struct PokemonScreenFactory {
    @ViewBuilder
    public static func createList(router: PokemonRouting) -> some View {
        ListScreen(
            viewModel: PokemonListViewModel(router: router)
        )
    }

    @ViewBuilder
    public static func createDetail(pokemon: PokemonInterface) -> some View {
        if let pokemon = pokemon as? Pokemon {
            DetailScreen(viewModel: PokemonDetailViewModel(pokemon: pokemon))
        } else {
            EmptyView()
        }
    }
}

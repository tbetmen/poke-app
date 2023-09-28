//
//  MainCoordinator.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Foundation
import Stinsen
import SwiftUI

final class MainCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \MainCoordinator.pokemon)
    
    @Root var pokemon = makePokemon
}

extension MainCoordinator {
    private func makePokemon() -> NavigationViewCoordinator<PokemonCoordinator> {
        return NavigationViewCoordinator(PokemonCoordinator())
    }
}

//
//  PokemonRouter.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Foundation
import Stinsen
import FeaturePokemon

class PokemonRouter: PokemonRouting {
    @RouterObject
    var router: NavigationRouter<PokemonCoordinator>?

    func navigateToDetail(pokemon: PokemonInterface) {
        router?.route(to: \.detail, pokemon)
    }
    
    func navigateToMyPokemon() {
        router?.route(to: \.mypokemon)
    }
}

//
//  MyPokemonScreenFactory.swift
//  FeatureMyPokemon
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import SwiftUI

public struct MyPokemonScreenFactory {
    @ViewBuilder
    public static func createMyPokemon() -> some View {
        MyPokemonScreen(viewModel: MyPokemonViewModel())
    }
}

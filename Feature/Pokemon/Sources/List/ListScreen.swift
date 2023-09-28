//
//  ListScreen.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Common
import SwiftUI

struct ListScreen<T: PokemonListViewModelInterface>: View {
    @StateObject var viewModel: T
    
    var body: some View {
        buildContentView()
            .navigationTitle("Pokemon List")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: viewModel.navigateToMyPokemon) {
                        Text("My Pokemon")
                    }
                }
            }
            .task {
                viewModel.loadPokemonList()
            }
    }
    
    @ViewBuilder
    private func buildContentView() -> some View {
        List(viewModel.pokemonList) { pokemon in
            buildCellView(using: pokemon)
                .onTapGesture {
                    viewModel.navigateToDetail(pokemon: pokemon)
                }
        }
        .listStyle(.plain)
    }
    
    @ViewBuilder
    private func buildCellView(using pokemon: Pokemon) -> some View {
        HStack {
            WebImage(
                url: URL(string: pokemon.imageURL),
                config: {
                    AnyView(
                        AnyView($0.resizable())
                            .frame(width: 100, height: 100)
                    )
                },
                placeholder: {
                    AnyView(
                        CommonAsset.ball.swiftUIImage
                            .resizable()
                            .frame(width: 100, height: 100)
                    )
                }
            )
            
            Text(pokemon.name)
                .font(.system(size: 30))
        }
        .listRowInsets(.none)
        .listRowSeparator(.hidden)
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListScreen(viewModel: PokemonListViewModel())
        }
    }
}

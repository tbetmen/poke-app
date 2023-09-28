//
//  MyPokemonScreen.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Common
import SwiftUI

struct MyPokemonScreen<T: MyPokemonViewModelInterface>: View {
    @StateObject var viewModel: T

    var body: some View {
        buildContentView()
            .alert(
                viewModel.releaseMessage,
                isPresented: $viewModel.isShownReleaseDialog
            ) {
                Button("OK", role: .cancel) {}
            }
            .alert(
                viewModel.renameMessage,
                isPresented: $viewModel.isShownRenameDialog
            ) {
                Button("OK", role: .cancel) {}
            }
            .navigationTitle("My Pokemon List")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                viewModel.loadPokemon()
            }
    }

    @ViewBuilder
    private func buildContentView() -> some View {
        List(viewModel.localPokemonList) {
            buildCellView($0)
        }
        .listStyle(.plain)
    }

    @ViewBuilder
    private func buildCellView(_ pokemon: LocalPokemon) -> some View {
        HStack {
            HStack {
                buildImageView(pokemon.imageURL)
                buildNameView(pokemon)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Group {
                    Button("Rename") {
                        viewModel.renamePokemon(currentName: pokemon.nickname)
                    }
                    Button("Release") {
                        viewModel.releasePokemon(currentName: pokemon.nickname)
                    }
                }
                .buttonStyle(.bordered)
                .font(.system(size: 10))
            }
            .frame(alignment: .trailing)
        }
        .listRowInsets(.none)
        .listRowSeparator(.hidden)
    }
    
    @ViewBuilder
    private func buildImageView(_ imageURL: String) -> some View {
        WebImage(
            url: URL(string: imageURL),
            config: {
                AnyView(
                    AnyView($0.resizable())
                        .frame(width: 50, height: 50)
                )
            },
            placeholder: {
                AnyView(
                    CommonAsset.ball.swiftUIImage
                        .resizable()
                        .frame(width: 50, height: 50)
                )
            }
        )
    }

    @ViewBuilder
    private func buildNameView(_ pokemon: LocalPokemon) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("Name")
                    .font(.caption)
                Text(pokemon.name)
                    .font(.system(size: 15))
            }
            HStack {
                Text("Nickname")
                    .font(.caption)
                Text(pokemon.nickname)
                    .font(.system(size: 15))
            }
        }
    }
}

struct MyPokemonScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyPokemonScreen(viewModel: MyPokemonViewModel())
        }
    }
}

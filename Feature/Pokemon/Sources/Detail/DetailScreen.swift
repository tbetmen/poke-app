//
//  DetailScreen.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Common
import SwiftUI

struct DetailScreen<T: PokemonDetailViewModelInterface>: View {
    @StateObject var viewModel: T

    var body: some View {
        buildContentView()
            .alert(
                viewModel.catchMessage,
                isPresented: $viewModel.isShowCatchDialog
            ) {
                if viewModel.isCatchSuccess {
                    TextField("Enter Nickname", text: $viewModel.nickname)
                }

                Button("OK", role: .cancel, action: viewModel.savePokemon)
            }
            .alert(
                viewModel.saveMessage,
                isPresented: $viewModel.isShowSaveDialog
            ) {
                Button("OK", role: .cancel) {}
            }
            .ignoresSafeArea(.keyboard)
            .navigationTitle(viewModel.pokemon.name)
    }

    @ViewBuilder
    private func buildContentView() -> some View {
        VStack {
            ScrollView {
                buildImageView()
                buildDetailItemsView()
            }

            if !viewModel.isCatchSuccess {
                Button(action: viewModel.catchPokemon) {
                    Text("Catch")
                        .frame(height: 30)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }
        }
        .padding(16)
        .overlay {
            ActivityIndicator(isAnimating: $viewModel.isLoading)
        }
    }

    @ViewBuilder
    private func buildImageView() -> some View {
        WebImage(
            url: URL(string: viewModel.pokemon.imageURL),
            config: {
                AnyView(
                    AnyView($0.resizable())
                        .frame(width: 200, height: 200)
                )
            },
            placeholder: {
                AnyView(
                    CommonAsset.ball.swiftUIImage
                        .resizable()
                        .frame(width: 200, height: 200)
                )
            }
        )
    }

    @ViewBuilder
    private func buildDetailItemsView() -> some View {
        VStack(spacing: 16) {
            buildDetailItemView(
                title: "Height",
                value: "\(viewModel.pokemon.height)"
            )
            buildDetailItemView(
                title: "Weight",
                value: "\(viewModel.pokemon.weight)"
            )
            buildDetailItemView(
                title: "Types",
                value: viewModel.typesFormatted
            )
            buildDetailItemView(
                title: "Moves",
                value: viewModel.movesFormatted
            )
        }
    }
    
    @ViewBuilder
    private func buildDetailItemView(
        title: String,
        value: String
    ) -> some View {
        HStack(alignment: .firstTextBaseline) {
            Text(title)
                .font(.body)
            Text(value)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailScreen(
                viewModel: PokemonDetailViewModel(pokemon: Pokemon())
            )
        }
    }
}

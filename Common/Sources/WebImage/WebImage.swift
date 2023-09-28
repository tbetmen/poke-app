//
//  WebImage.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import SwiftUI

public struct WebImage: View {
    @StateObject private var viewModel: WebImageViewModel
    
    @State var isAnimating: Bool = false
    private let config: (Image) -> AnyView
    private let placeholder: (() -> AnyView)?
    
    public init(
        url: URL?,
        config: @escaping (Image) -> AnyView = { AnyView($0) },
        placeholder: (() -> AnyView)? = nil
    ) {
        self.config = config
        self.placeholder = placeholder
        _viewModel = StateObject(
            wrappedValue: WebImageViewModel(
                url: url ?? URL(string: "https://i.pinimg.com/736x/d2/52/49/d25249ce7b98705d9e9ca48d461857bb.jpg")!
            )
        )
    }
    
    public var body: some View {
        Group {
            if self.viewModel.image != nil {
                self.config(
                    Image(uiImage: self.viewModel.image!)
                        .renderingMode(.original)
                )
            } else {
                if self.placeholder != nil {
                    self.placeholder?()
                        .onAppear { self.viewModel.load() }
                        .onDisappear { self.viewModel.cancel() }
                } else {
                    ActivityIndicator(isAnimating: self.$isAnimating)
                        .onAppear { self.viewModel.load() }
                        .onDisappear { self.viewModel.cancel() }
                }
            }
        }
        .transition(.opacity)
        .animation(.linear(duration: 0.25), value: isAnimating)
    }
}

struct WebImage_Previews: PreviewProvider {
    static var previews: some View {
        WebImage(
            url: URL(string: "https://assets.stickpng.com/images/580b57fcd9996e24bc43c325.png"),
            config: {
                AnyView(
                    AnyView($0.resizable())
                        .frame(width: 200, height: 200)
                )
            },
            placeholder: {
                AnyView(
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 200, height: 200)
                )
            }
        )
    }
}

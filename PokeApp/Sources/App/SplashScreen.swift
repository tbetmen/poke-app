//
//  SplashScreen.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Common
import SwiftUI

struct SplashScreen: View {
    @Binding var isFinished: Bool
    @State private var isRotating = false

    var body: some View {
        VStack {
            CommonAsset.ball.swiftUIImage
                .resizable()
                .frame(width: 200, height: 200)
                .rotationEffect(Angle(degrees: isRotating ? 720 : 0))
                .animation(.linear(duration: 1.5), value: isRotating)
                .onAppear {
                    isRotating = true

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        isFinished = true
                    }
                }
        }
        .frame(maxHeight: .infinity, alignment: .center)
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen(isFinished: .constant(false))
    }
}

//
//  PokeApp.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import SwiftUI

@main
struct PokeApp: App {
    
    @State private var isSplashFinished = false

    init() {
        UINavigationBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }

    var body: some Scene {
        WindowGroup {
            if isSplashFinished {
                MainCoordinator().view()
            } else {
                SplashScreen(isFinished: $isSplashFinished)
            }
        }
    }
}

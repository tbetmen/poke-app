//
//  Dependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by Muhammad M. Munir on 28/09/23.
//

import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(
            url: "https://github.com/rundfunk47/stinsen.git",
            requirement: .exact("2.0.13")
        ),
    ],
    platforms: [.iOS]
)

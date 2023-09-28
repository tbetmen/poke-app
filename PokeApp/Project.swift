//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Muhammad M. Munir on 28/09/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(
    name: "PokeApp",
    platform: .iOS,
    dependencies: [
        .project(
            target: "Common",
            path: .relativeToRoot("Common")
        ),
        .project(
            target: "FeatureMyPokemon",
            path: .relativeToRoot("Feature/MyPokemon")
        ),
        .project(
            target: "FeaturePokemon",
            path: .relativeToRoot("Feature/Pokemon")
        ),
    ]
)

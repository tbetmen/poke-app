//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Muhammad M. Munir on 28/09/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let featureMyPokemon = Project.makeFramework(
    name: "FeatureMyPokemon",
    sources: .paths([
        Path.relativeToRoot("Feature/MyPokemon/Sources/**"),
    ]),
    dependencies: [
        .project(target: "Common", path: .relativeToRoot("Common"))
    ]
)

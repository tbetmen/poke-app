//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Muhammad M. Munir on 28/09/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let featurePokemon = Project.makeFramework(
    name: "FeaturePokemon",
    sources: .paths([
        Path.relativeToRoot("Feature/Pokemon/Sources/**"),
    ]),
    dependencies: [
        .project(target: "Common", path: .relativeToRoot("Common"))
    ]
)

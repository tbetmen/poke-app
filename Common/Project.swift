//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Muhammad M. Munir on 28/09/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let common = Project.makeFramework(
    name: "Common",
    sources: .paths([
        Path.relativeToRoot("Common/Sources/**"),
    ]),
    resources: [
        .glob(pattern: .relativeToRoot("Common/Resources/**")),
    ],
    dependencies: [
        .external(name: "Stinsen"),
    ]
)

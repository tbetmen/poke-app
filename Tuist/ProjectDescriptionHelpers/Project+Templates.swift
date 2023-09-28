import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

let ORGANIZATION_NAME = "Infinity"
let IDENTIFIER_NAME = "com.infinity"

extension Project {
    /// Helper function to create the Project for this ExampleApp
    public static func app(
        name: String,
        platform: Platform,
        dependencies: [TargetDependency] = []
    ) -> Project {
        let targets = makeAppTargets(
            name: name,
            platform: platform,
            dependencies: dependencies
        )
        return Project(
            name: name,
            organizationName: ORGANIZATION_NAME,
            targets: targets
        )
    }

    // MARK: - Private

    /// Helper function to create a framework targets
    public static func makeFramework(
        name: String,
        sources: SourceFilesList = [],
        resources: ResourceFileElements? = nil,
        dependencies: [TargetDependency] = []
    ) -> Project {
        let main = Target(
            name: name,
            platform: .iOS,
            product: .framework,
            bundleId: "\(IDENTIFIER_NAME).\(name.lowercased())",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: sources,
            resources: resources,
            dependencies: dependencies
        )
        return Project(
            name: name,
            organizationName: ORGANIZATION_NAME,
            targets: [main]
        )
    }

    /// Helper function to create the application target
    private static func makeAppTargets(
        name: String,
        platform: Platform,
        dependencies: [TargetDependency]
    ) -> [Target] {
        let platform: Platform = platform
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
        ]

        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "\(IDENTIFIER_NAME).\(name)",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone, .ipad]),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: dependencies
        )
        return [mainTarget]
    }
}

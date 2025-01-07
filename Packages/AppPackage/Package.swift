// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// MARK: - Pacakge
let package = Package(
    name: "AppPackage",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: Products.allValues,
    dependencies: Dependencies.allValues,
    targets: Targets.allValues
)

// MARK: - Settings
let otherSwiftFlagsForDebug = [
    "-Xfrontend", "-warn-long-expression-type-checking=500",
    "-Xfrontend", "-warn-long-function-bodies=500",
]

let swiftSettings: [PackageDescription.SwiftSetting] = [
    .unsafeFlags(otherSwiftFlagsForDebug, .when(configuration: .debug)),
    .existentialAny,
    .internalImportsByDefault,
]

extension SwiftSetting {
    static let existentialAny: Self = .enableUpcomingFeature("ExistentialAny") // SE-0335, Swift 5.6,  SwiftPM 5.8+
    static let internalImportsByDefault: Self = .enableUpcomingFeature("InternalImportsByDefault") // SE-0409, Swift 6.0,  SwiftPM 6.0+
}

// MARK: - Products
enum Products: String, CaseIterable, PackageAtom {
    case entity
    case getPokemonListUseCase
    case logger
    case pokeAPIClientWrapper
    case routerCore
    case sharedExtension

    var targets: [String] {
        Targets.targets(for: self)
    }

    var value: Product {
        Product.library(
            name: capitalizedName,
            targets: targets
        )
    }
}

// MARK: - Dependencies
enum Dependencies: String, CaseIterable, PackageAtom {
    case swiftLint
    case swiftOpenAPIGenerator = "swift-openapi-generator"
    case swiftDependencies = "swift-dependencies"
    case swiftOpenAPIRuntime = "swift-openapi-runtime"
    case swiftOpenAPIUrlSession = "swift-openapi-urlsession"

    var value: Package.Dependency {
        switch self {
        case .swiftLint:
            .package(
                url: "https://github.com/realm/SwiftLint.git",
                from: "0.57.0"
            )
        case .swiftDependencies:
            .package(
                url: "https://github.com/pointfreeco/swift-dependencies.git", exact: "1.4.1"
            )
        case .swiftOpenAPIGenerator:
            .package(
                url: "https://github.com/apple/swift-openapi-generator", exact: "1.3.1"
            )
        case .swiftOpenAPIRuntime:
            .package(
                url: "https://github.com/apple/swift-openapi-runtime", exact: "1.5.0"
            )
        case .swiftOpenAPIUrlSession:
            .package(
                url: "https://github.com/apple/swift-openapi-urlsession", exact: "1.0.2"
            )
        }
    }

    func asDependency(productName: ProductName) -> Target.Dependency {
        switch productName {
        case let .specified(moduleName):
            .product(name: moduleName, package: name)
        case .usePackageName:
            .product(name: name, package: name)
        }
    }

    enum ProductName {
        case specified(name: String)
        case usePackageName
    }
}

// MARK: - Targets
enum Targets: String, CaseIterable, PackageAtom {
    case entity
    case getPokemonListUseCase
    case logger
    case pokeAPIClientWrapper
    case routerCore
    case sharedExtension

    var targetType: TargetType {
        switch self {
        case .entity,
             .getPokemonListUseCase,
             .logger,
             .pokeAPIClientWrapper,
             .routerCore,
             .sharedExtension:
            .production
        }
    }

    static var commonDependenciesForScreen: [Target.Dependency] {
        [
            Dependencies.swiftDependencies.asDependency(productName: .specified(name: "Dependencies")),
            Targets.entity.asDependency,
            Targets.logger.asDependency,
        ]
    }

    var pathName: String {
        switch self {
        case .entity,
             .logger:
            "\(capitalizedName)"
        case .getPokemonListUseCase:
            "UseCases/\(capitalizedName)"
        case .pokeAPIClientWrapper:
            "Wrappers/\(capitalizedName)"
        case .routerCore:
            "Router/\(capitalizedName)"
        case .sharedExtension:
            "Extension/\(capitalizedName)"
        }
    }

    var dependencies: [Target.Dependency] {
        switch self {
        case .entity:
            [
                Targets.sharedExtension.asDependency
            ]
        case .getPokemonListUseCase:
            [
                Targets.sharedExtension.asDependency,
                Dependencies.swiftDependencies.asDependency(productName: .specified(name: "Dependencies")),
                Targets.entity.asDependency,
                Targets.pokeAPIClientWrapper.asDependency,
            ]
        case .logger:
            [
                Targets.sharedExtension.asDependency,
                Dependencies.swiftDependencies.asDependency(productName: .specified(name: "Dependencies")),
            ]
        case .pokeAPIClientWrapper:
            [
                Targets.sharedExtension.asDependency,
                Dependencies.swiftOpenAPIRuntime.asDependency(productName: .specified(name: "OpenAPIRuntime")),
                Dependencies.swiftOpenAPIUrlSession.asDependency(productName: .specified(name: "OpenAPIURLSession")),
                Dependencies.swiftDependencies.asDependency(productName: .specified(name: "Dependencies")),
                Targets.entity.asDependency,
            ]
        case .routerCore:
            [
                Targets.sharedExtension.asDependency,
                Targets.entity.asDependency,
            ]
        case .sharedExtension:
            []
        }
    }

    var plugins: [Target.PluginUsage] {
        switch self {
        case .pokeAPIClientWrapper:
            [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLint"),
                .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator"),
            ]
        default:
            [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLint"),
            ]
        }
    }

    var value: Target {
        switch targetType {
        case .production:
            .target(
                name: capitalizedName,
                dependencies: dependencies,
                path: "./Sources/\(pathName)",
                swiftSettings: swiftSettings,
                plugins: plugins
            )
        case .test:
            .testTarget(
                name: capitalizedName,
                dependencies: dependencies,
                path: "./Tests/\(pathName)",
                swiftSettings: swiftSettings,
                plugins: plugins
            )
        }
    }

    var asDependency: Target.Dependency {
        .target(name: value.name)
    }

    static func targets(for product: Products) -> [String] {
        Targets.allCases.map(\.capitalizedName).filter { $0 == product.capitalizedName }
    }
}

// MARK: - PackageAtom
protocol PackageAtom {
    associatedtype ValueType

    var name: String { get }
    var value: ValueType { get }
}

extension PackageAtom where Self: RawRepresentable, Self.RawValue == String {

    var name: String {
        rawValue
    }

    var capitalizedName: String {
        rawValue.initialLetterUppercased()
    }
}

extension PackageAtom where Self: CaseIterable {

    static var allValues: [ValueType] {
        allCases.map(\.value)
    }
}

extension String {

    func initialLetterUppercased() -> Self {
        prefix(1).uppercased() + dropFirst()
    }
}

// MARK: - Targets.TargetType
extension Targets {

    enum TargetType {
        case production
        case test

        var isTestTarget: Bool {
            self == .test
        }
    }
}

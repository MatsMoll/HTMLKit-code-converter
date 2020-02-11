// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Safeleaf-generator",
    platforms: [
      .macOS(.v10_14),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        .package(url: "https://github.com/MatsMoll/BootstrapKit.git", from: "1.0.0-beta.3"),
        .package(url: "https://github.com/MatsMoll/htmlkit-vapor-3-provider.git", from: "1.0.0-beta.3")
    ],
    targets: [
        .target(name: "App", dependencies: ["BootstrapKit", "Vapor", "HTMLKitVaporProvider"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)


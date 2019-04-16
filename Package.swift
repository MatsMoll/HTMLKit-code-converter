// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Safeleaf-generator",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        // 🍃 An expressive, performant, and extensible templating language built for Swift.
        .package(url: "https://github.com/vapor-community/HTMLKit.git", from: "1.2.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["HTMLKit", "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)


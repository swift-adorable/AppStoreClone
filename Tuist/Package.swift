// swift-tools-version: 5.10.0
import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: [:]
        // productTypes: ["Alamofire": .framework,]
        productTypes: ["Swinject": .framework]
        
    )
#endif

let package = Package(
    name: "AppStoreClone",
    dependencies: [
        // Add your own dependencies here:
        // .package(url: "https://github.com/Alamofire/Alamofire", from: "5.0.0"),
        // You can read more about dependencies here: https://docs.tuist.io/documentation/tuist/dependencies
        .package(url: "https://github.com/Swinject/Swinject.git", branch: "master"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", branch: "master"),
//        .package(url: "https://github.com/Swinject/Swinject.git", branch: "master")
        
//        .remote(url: "https://github.com/onevcat/Kingfisher.git", requirement: .exact("7.6.2")),
//        .remote(url: "https://github.com/slackhq/PanModal.git", requirement: .exact("1.2.6")),
    ]
)

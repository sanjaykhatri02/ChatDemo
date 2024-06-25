// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChatDemo",
    platforms: [
            .iOS(.v13)
        ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ChatDemo",
            targets: ["ChatDemo"]),
    ],
    dependencies: [
            // Add your dependencies here
            .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.9.0"),
            .package(url: "https://github.com/andreybuksha/LMCSideMenu.git", from: "0.1.6"),
            .package(url: "https://github.com/relatedcode/ProgressHUD.git", from: "13.5.0"),
            .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "5.0.0"),
            .package(url: "https://github.com/SVProgressHUD/SVProgressHUD.git", from: "2.2.5"),
            .package(url: "https://github.com/ninjaprox/NVActivityIndicatorView.git", from: "5.0.0"),
            .package(url: "https://github.com/hackiftekhar/IQKeyboardManager.git", from: "6.5.6"),
            .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.0.0"), // Firebase SDK
            .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.0.0"),
            .package(url: "https://github.com/cesarferreira/SwiftEventBus.git", from: "5.1.0"),
            //.package(url: "https://github.com/bahlo/SwiftGif.git", from: "1.7.0"),
            .package(url: "https://github.com/ccgus/fmdb.git", from: "2.7.5"),
            .package(url: "https://github.com/moozzyk/SignalR-Client-Swift", from: "0.9.0"),
//            .package(url: "https://github.com/devxoul/Toaster.git", from: "2.3.0"),
//            .package(url: "https://github.com/hirohisa/ImageLoaderSwift", from: "0.6.0"),
            .package(url: "https://github.com/mikaoj/BSImagePicker.git", from: "3.3.0"),
            .package(url: "https://github.com/evgenyneu/Cosmos.git", from: "23.0.0")

            ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ChatDemo",
            dependencies: [
                            "Alamofire",
//                            "LMCSideMenu",
//                            "ProgressHUD",
                            "SwiftyJSON",
                            "SVProgressHUD",
//                            "NVActivityIndicatorView",
//                            "IQKeyboardManager",
//                            .product(name: "FirebaseCore", package: "firebase-ios-sdk"),
//                            .product(name: "FirebaseMessaging", package: "firebase-ios-sdk"),
                            "Kingfisher",
                            "SwiftEventBus",
//                            //"SwiftGif",
//                            "FMDB",
                            .product(name: "FMDB", package: "fmdb"),
                            .product(name: "SignalRClient", package: "SignalR-Client-Swift"),

//                            "SignalRClient"
//                            //"Toaster",
//                            //"ImageLoader",
                            "BSImagePicker",
                            "Cosmos"
                        ],
            path: "Sources/ChatDemo",
            resources: [
                            .process("Resources/Storyboards"),
                            .process("Resources/Xib"),
                            .process("Resources/Assets.xcassets"),
                            .process("Resources/Fonts"),
                            .process("Resources/Images"),
                            .process("Resources/**/*.gif")
                        ]
        ),
        .testTarget(
            name: "ChatDemoTests",
            dependencies: ["ChatDemo"]),
    ]
)

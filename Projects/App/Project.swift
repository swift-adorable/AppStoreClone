import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project
let project = Project(
    name: "AppStoreClone",
    organizationName: DefaultSetting.organizationName,
    packages: [
//        .kakaoSDK,
//        .swiftyBeaver,
//        .deviceKit,
//        .permissionsKit,
//        .firebaseSDK,
//        .netfox,
//        .admob
    ],
    settings: .settings(
        base: BuildSetting.Project.base,
        configurations: [
            .debug(name: .debug, settings: BuildSetting.Project.debug),
            .release(name: .release, settings: BuildSetting.Project.release)
        ]),
    targets: [
        .target(
            name: "AppStoreClone",
            destinations: .iOS,
            product: .app,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            deploymentTargets: .iOS(DefaultSetting.targetVersion.stringValue),
            infoPlist: .extendingDefault(with: [
                "CFBundleShortVersionString": "1.0",
                "CFBundleVersion": "1",
                "UIMainStoryboardFile": "",
                "UILaunchStoryboardName": "LaunchScreen"
            ]),
            sources: ["AppStoreClone/Sources/**"],
            resources: ["AppStoreClone/Resources/**"],
            scripts: [
            ],
            dependencies: [
                .Core.network,
                .Core.common,
                .Core.dependencyInjection,
                .target(name: "service-extension"),
                .target(name: "content-extension"),
            ],
            settings: .settings(
                base: BuildSetting.App.base,
                configurations: [
                    .debug(name: .debug, settings: BuildSetting.App.debug),
                    .release(name: .release, settings: BuildSetting.App.release)
                ])
        ),
        .target(
            name: "AppStoreCloneTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.sensei.lee.appstorecloneTests",
            deploymentTargets: .iOS(DefaultSetting.targetVersion.stringValue),
            infoPlist: .default,//"Targets/appstorecloneTests/Info.plist",
            sources: ["Tests/Sources/**"],
            resources: [],
            dependencies: [
                .target(name: "AppStoreClone"),
            ],
            settings: .settings(
                base: BuildSetting.AppTest.base,
                configurations: [
                    .debug(name: .debug, settings: BuildSetting.AppTest.debug),
                    .release(name: .release, settings: BuildSetting.AppTest.release)
                ])
        ),
        .target(
            name: "service-extension",
            destinations: .iOS,
            product: .appExtension,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            deploymentTargets: .iOS(DefaultSetting.targetVersion.stringValue),
            infoPlist: "service-extension/Info.plist",
            sources: ["service-extension/Sources/**"],
            dependencies: [],
            settings: .settings(
                base: BuildSetting.ServiceExtension.base,
                configurations: [
                    .debug(name: .debug, settings: BuildSetting.ServiceExtension.debug),
                    .release(name: .release, settings: BuildSetting.ServiceExtension.release)
                ])
        ),
        .target(
            name: "content-extension",
            destinations: .iOS,
            product: .appExtension,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            infoPlist: "content-extension/Info.plist",
            sources: ["content-extension/Sources/**"],
            resources: ["content-extension/Resources/**"],
            dependencies: [
                .sdk(name: "UserNotifications", type: .framework, status: .optional),
                .sdk(name: "UserNotificationsUI", type: .framework, status: .optional)
            ],
            settings: .settings(
                base: BuildSetting.ContentExtension.base,
                configurations: [
                    .debug(name: .debug, settings: BuildSetting.ContentExtension.debug),
                    .release(name: .release, settings: BuildSetting.ContentExtension.release)
                ])
        ),
        .target(
            name: "AppInterface",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.sensei.lee.appstoreclone.app-interface",
            deploymentTargets: .iOS(DefaultSetting.targetVersion.stringValue),
            infoPlist: .default,
            sources: ["AppInterface/Sources/**"],
            dependencies: [
                .Core.dependencyInjection,
                .Core.model
            ]
        )
    ],
    schemes: [
        .scheme(
            name: "AppStoreClone-debug",
            buildAction: .buildAction(targets: ["AppStoreClone"]),
            runAction: .runAction(
                configuration: .debug,
                attachDebugger: true
                //arguments: Arguments(launchArguments: [LaunchArgument(name: "-FIRDebugEnabled", isEnabled: true)])
            ),
            archiveAction: .archiveAction(configuration: .debug)
        ),
        .scheme(
            name: "AppStoreClone",
            buildAction: .buildAction(targets: ["AppStoreClone"]),
            runAction: .runAction(
                configuration: .release,
                attachDebugger: true
            )
        ),
        .scheme(
            name: "AppStoreCloneTests",
            buildAction: .buildAction(targets: ["AppStoreCloneTests"]),
            testAction: .targets(["AppStoreCloneTests"]),
            runAction: .runAction(
                configuration: .debug,
                attachDebugger: false
            )
        ),
        .scheme(
            name: "content-extension",
            buildAction: .buildAction(targets: ["content-extension", "AppStoreClone"])
        ),
        .scheme(
            name: "service-extension",
            buildAction: .buildAction(targets: ["service-extension", "AppStoreClone"])
        )
    ]
)

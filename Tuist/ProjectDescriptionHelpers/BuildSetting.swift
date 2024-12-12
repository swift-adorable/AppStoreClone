//
//  BuildSetting.swift
//  ProjectDescriptionHelpers
//
//  Created by 이정호 on 12/10/24.
//

import ProjectDescription

public struct BuildSetting {
    
    public struct Project {
        
        public static let base: SettingsDictionary = [
            "ALWAYS_SEARCH_USER_PATHS": "NO",
            "CLANG_ANALYZER_NONNULL": "YES",
            "CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION": "YES_AGGRESSIVE",
            "CLANG_CXX_LANGUAGE_STANDARD": "gnu++14",
            "CLANG_CXX_LIBRARY": "libc++",
            "CLANG_ENABLE_MODULES": "YES",
            "CLANG_ENABLE_OBJC_ARC": "YES",
            "CLANG_ENABLE_OBJC_WEAK": "YES",
            "CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING": "YES",
            "CLANG_WARN_BOOL_CONVERSION": "YES",
            "CLANG_WARN_COMMA": "YES",
            "CLANG_WARN_CONSTANT_CONVERSION": "YES",
            "CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS": "YES",
            "CLANG_WARN_DIRECT_OBJC_ISA_USAGE": "YES_ERROR",
            "CLANG_WARN_DOCUMENTATION_COMMENTS": "YES",
            "CLANG_WARN_EMPTY_BODY": "YES",
            "CLANG_WARN_ENUM_CONVERSION": "YES",
            "CLANG_WARN_INFINITE_RECURSION": "YES",
            "CLANG_WARN_INT_CONVERSION": "YES",
            "CLANG_WARN_NON_LITERAL_NULL_CONVERSION": "YES",
            "CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF": "YES",
            "CLANG_WARN_OBJC_LITERAL_CONVERSION": "YES",
            "CLANG_WARN_OBJC_ROOT_CLASS": "YES_ERROR",
            "CLANG_WARN_RANGE_LOOP_ANALYSIS": "YES",
            "CLANG_WARN_STRICT_PROTOTYPES": "YES",
            "CLANG_WARN_SUSPICIOUS_MOVE": "YES",
            "CLANG_WARN_UNGUARDED_AVAILABILITY": "YES_AGGRESSIVE",
            "CLANG_WARN_UNREACHABLE_CODE": "YES",
            "CLANG_WARN__DUPLICATE_METHOD_MATCH": "YES",
            "COPY_PHASE_STRIP": "NO",
            "ENABLE_STRICT_OBJC_MSGSEND": "YES",
            "GCC_C_LANGUAGE_STANDARD": "gnu11",
            "GCC_NO_COMMON_BLOCKS": "YES",
            "GCC_WARN_64_TO_32_BIT_CONVERSION": "YES",
            "GCC_WARN_ABOUT_RETURN_TYPE": "YES_ERROR",
            "GCC_WARN_UNDECLARED_SELECTOR": "YES",
            "GCC_WARN_UNINITIALIZED_AUTOS": "YES_AGGRESSIVE",
            "GCC_WARN_UNUSED_FUNCTION": "YES",
            "GCC_WARN_UNUSED_VARIABLE": "YES",
            "IPHONEOS_DEPLOYMENT_TARGET": "16.0",
            "MTL_FAST_MATH": "YES",
            "SDKROOT": "iphoneos",
        ]
        
        public static let debug: SettingsDictionary = [
            "DEBUG_INFORMATION_FORMAT": "dwarf",
            "ENABLE_TESTABILITY": "YES",
            "GCC_DYNAMIC_NO_PIC" :"NO",
            "GCC_OPTIMIZATION_LEVEL": "0",
            "GCC_PREPROCESSOR_DEFINITIONS": "DEBUG=1 $(inherited)",
            "MTL_ENABLE_DEBUG_INFO": "INCLUDE_SOURCE",
            "ONLY_ACTIVE_ARCH": "YES",
            "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "DEBUG",
            "SWIFT_OPTIMIZATION_LEVEL": "-Onone"
        ]
        
        public static let release: SettingsDictionary = [
            "DEBUG_INFORMATION_FORMAT": "dwarf-with-dsym",
            "ENABLE_NS_ASSERTIONS": "NO",
            "MTL_ENABLE_DEBUG_INFO": "NO",
            "SWIFT_COMPILATION_MODE": "wholemodule",
            "SWIFT_OPTIMIZATION_LEVEL": "-O",
            "VALIDATE_PRODUCT": "YES"
        ]
    }
    
    public struct App {
        
        public static let base: SettingsDictionary = [
            "MARKETING_VERSION": DefaultSetting.appVersion,
            "CURRENT_PROJECT_VERSION": DefaultSetting.buildNumber,
            "ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES": "YES",
            "CODE_SIGN_STYLE": "Automatic",
            "DEVELOPMENT_TEAM": "QMB27NV87J", // 여기에 개발 팀 ID를 입력하세요
            "CODE_SIGN_IDENTITY": "Apple Development",
            "CODE_SIGN_IDENTITY[sdk=iphoneos*]": "iPhone Developer",
            "ENABLE_BITCODE": "NO",
            "SWIFT_VERSION": "5.0",
            "FRAMEWORK_SEARCH_PATHS": "$(inherited) $(PROJECT_DIR)",
            "LD_RUNPATH_SEARCH_PATHS": "$(inherited) @executable_path/Frameworks",
            "OTHER_LDFLAGS": "$(inherited) -framework 'Accelerate' -framework 'CFNetwork'",
        ]
        
        public static let debug: SettingsDictionary = [
            "APP_DISPLAY_NAME": "AppStoreClone-Dev",
            "DEBUG_INFORMATION_FORMAT": "dwarf-with-dsym",
            "PRODUCT_BUNDLE_IDENTIFIER": "com.sensei.lee.appstoreclone-debug",
            "PRODUCT_MODULE_NAME": "AppStoreClone",
            "PRODUCT_NAME": "AppStoreClone-debug",
            "ASSETCATALOG_COMPILER_APPICON_NAME": "AppIcon-Dev"
        ]
        
        public static let release: SettingsDictionary = [
            "APP_DISPLAY_NAME": "AppStoreClone",
            "ONLY_ACTIVE_ARCH": "YES",
            "PRODUCT_BUNDLE_IDENTIFIER": "com.sensei.lee.appstoreclone",
            "PRODUCT_NAME": "AppStoreClone",
            "ASSETCATALOG_COMPILER_APPICON_NAME": "AppIcon"
        ]
    }
    
    public struct AppTest {
        
        public static let base: SettingsDictionary = [
            "ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES": "YES",
            "BUNDLE_LOADER": "$(TEST_HOST)",
            "CODE_SIGN_STYLE": "Automatic",
            "DEVELOPMENT_TEAM": "QMB27NV87J", // 여기에 개발 팀 ID를 입력하세요
            "CODE_SIGN_IDENTITY": "Apple Development",
            "CODE_SIGN_IDENTITY[sdk=iphoneos*]": "iPhone Developer",
            "PRODUCT_NAME": "$(TARGET_NAME)",
            "SWIFT_VERSION": "5.0",
        ]
        
        public static let debug: SettingsDictionary = [
            "LD_RUNPATH_SEARCH_PATHS": "$(inherited) @executable_path/Frameworks @loader_path/Frameworks"
        ]
        
        public static let release: SettingsDictionary = [
            "LD_RUNPATH_SEARCH_PATHS": "$(inherited) @executable_path/Frameworks @loader_path/Frameworks"
        ]
    }
    
    public struct ServiceExtension {
        
        public static let base: SettingsDictionary = [
            "MARKETING_VERSION": DefaultSetting.appVersion,
            "CURRENT_PROJECT_VERSION": DefaultSetting.buildNumber,
            "CLANG_CXX_LANGUAGE_STANDARD": "gnu++17",
            "CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER": "YES",
            "CODE_SIGN_STYLE": "Automatic",
            "DEVELOPMENT_TEAM": "QMB27NV87J", // 여기에 개발 팀 ID를 입력하세요
            "CODE_SIGN_IDENTITY": "Apple Development",
            "CODE_SIGN_IDENTITY[sdk=iphoneos*]": "iPhone Developer",
            "GENERATE_INFOPLIST_FILE": "YES",
            "INFOPLIST_KEY_CFBundleDisplayName": "service-extension",
            "INFOPLIST_KEY_NSHumanReadableCopyright": "Copyright © 2024 Sensei.Lee. All rights reserved.",
            "PRODUCT_NAME": "$(TARGET_NAME)",
            "SKIP_INSTALL": "YES",
            "SWIFT_EMIT_LOC_STRINGS": "YES",
            "SWIFT_VERSION": "5.0",
            "LD_RUNPATH_SEARCH_PATHS": "$(inherited) @executable_path/Frameworks @executable_path/../../Frameworks"
        ]
        
        public static let debug: SettingsDictionary = [
            "PRODUCT_BUNDLE_IDENTIFIER": "com.sensei.lee.appstoreclone-debug.service-extension",
            "PROVISIONING_PROFILE_SPECIFIER[sdk=iphoneos*]": "jungho lee"
        ]
        
        public static let release: SettingsDictionary = [
            "PRODUCT_BUNDLE_IDENTIFIER": "com.sensei.lee.appstoreclone.service-extension",
            "PROVISIONING_PROFILE_SPECIFIER[sdk=iphoneos*]": "jungho lee"
        ]
    }
    
    public struct ContentExtension {
        
        public static let base: SettingsDictionary = [
            "MARKETING_VERSION": DefaultSetting.appVersion,
            "CURRENT_PROJECT_VERSION": DefaultSetting.buildNumber,
            "CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER": "YES",
            "CODE_SIGN_STYLE": "Automatic",
            "DEVELOPMENT_TEAM": "QMB27NV87J", // 여기에 개발 팀 ID를 입력하세요
            "CODE_SIGN_IDENTITY": "Apple Development",
            "CODE_SIGN_IDENTITY[sdk=iphoneos*]": "iPhone Developer",
            "PRODUCT_NAME": "$(TARGET_NAME)",
            "SKIP_INSTALL": "YES",
            "SWIFT_VERSION": "5.0",
            "LD_RUNPATH_SEARCH_PATHS": "$(inherited) @executable_path/Frameworks @executable_path/../../Frameworks"
        ]
        
        public static let debug: SettingsDictionary = [
            "PRODUCT_BUNDLE_IDENTIFIER": "com.sensei.lee.appstoreclone-debug.content-extension"
        ]
        
        public static let release: SettingsDictionary = [
            "PRODUCT_BUNDLE_IDENTIFIER": "com.sensei.lee.appstoreclone.content-extension"
        ]
    }
}

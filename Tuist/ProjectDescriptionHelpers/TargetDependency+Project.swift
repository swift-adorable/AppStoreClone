import ProjectDescription

public extension TargetDependency {
    
    class App {
        
    }
    
    class Core {
        
        public static let network = TargetDependency.project(
            target: "Network",
            path: .relativeToRoot("Projects/Core/Network")
        )
        
        public static let common = TargetDependency.project(
            target: "Common",
            path: .relativeToRoot("Projects/Core/Common")
        )
        
        public static let model = TargetDependency.project(
            target: "Model",
            path: .relativeToRoot("Projects/Core/Model")
        )
        
        public static let dependencyInjection = TargetDependency.project(
            target: "DependencyInjection",
            path: .relativeToRoot("Projects/Core/DependencyInjection")
        )
        
    }
    
    class Feature {
        
        public static let today = TargetDependency.project(
            target: "Today",
            path: .relativeToRoot("Projects/Feature/Today")
        )
        
    }
    
    class SPM {

        public static let swinject = TargetDependency.external(name: "Swinject")
        public static let kingfisher = TargetDependency.external(name: "Kingfisher")
        
//        public static let lottie = TargetDependency.external(name: "Lottie")
//        public static let snapKit = TargetDependency.external(name: "SnapKit")
//        public static let then = TargetDependency.external(name: "Then")
//        public static let panModal = TargetDependency.external(name: "PanModal")
//        public static let combineCocoa = TargetDependency.external(name: "CombineCocoa")
    }
    
}

import ProjectDescription
import ProjectDescriptionHelpers

let name = "Network"

let project = Project.makeModule(
    name: name,
    product: .framework,
    dependencies: [
        .Core.common,
        //.Core.designSystem
    ]
)

import ProjectDescription
import ProjectDescriptionHelpers

let name = "Today"

let project = Project.makeFeatureModule(
    name: name,
    dependencies: [
        .Core.network,
        .Core.common,
        .Core.model,
        .SPM.kingfisher
    ],
    includeInterface: false,
    includeDemo: true
)

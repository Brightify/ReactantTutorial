// MainWireframe.swift
import UIKit
import Reactant

final class MainWireframe: Wireframe {
    private let module: DependencyModule

    init(module: DependencyModule) {
        self.module = module
    }

    func entrypoint() -> UIViewController {
        return greeter(language: .english)
    }

    private func greeter(language: GreeterService.Language) -> GreeterController {
        return create { _ in
            let dependencies = GreeterController.Dependencies(
                greeterService: module.greeterService(language: language)
            )
            let reactions = GreeterController.Reactions(
                openUrl: { url in
                    UIApplication.shared.open(url)
            }
            )
            return GreeterController(dependencies: dependencies, reactions: reactions)
        }
    }
}

// GreeterController.swift
import Reactant

final class GreeterController: ControllerBase<String, GreeterRootView> {
    struct Dependencies {
        let greeterService: GreeterService
    }
    struct Reactions {
        let openUrl: (URL) -> Void
    }

    private let dependencies: Dependencies
    private let reactions: Reactions

    init(dependencies: Dependencies, reactions: Reactions) {
        self.dependencies = dependencies
        self.reactions = reactions

        super.init(title: "Greeter")

        // Set Controller's initial state
        componentState = ""
    }

    override func update() {
        rootView.componentState = (greeting: dependencies.greeterService.greet(user: componentState),
                                   name: componentState)
    }

    // Act on actions produced from RootView
    override func act(on action: GreeterAction) {
        switch action {
        case .greetingChanged(let greeting):
            componentState = greeting

            if greeting == "Reactant" {
                reactions.openUrl(URL(string: "http://reactant.tech")!)
            }
        }
    }
}

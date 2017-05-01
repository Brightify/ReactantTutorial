// GreeterRootView.swift
import Reactant
import RxSwift

enum GreeterAction {
    case greetingChanged(String)
}

final class GreeterRootView: ViewBase<(greeting: String, name: String), GreeterAction>, RootView {
    override var actions: [Observable<GreeterAction>] {
        return [
            // Skipping first event as UITextField.rx.text sends first value
            // when subscribed, but we want later changes
            nameField.rx.text.skip(1).map { GreeterAction.greetingChanged($0 ?? "") }
        ]
    }

    private let greeting = UILabel()
    private let nameField = UITextField()

    override func update() {
        greeting.text = componentState.greeting

        if componentState.name != nameField.text {
            nameField.text = componentState.name
        }
    }

    override func loadView() {
        children(
            greeting,
            nameField
        )

        backgroundColor = .white
        greeting.textColor = .red
        nameField.placeholder = "Name to greet"
    }

    override func setupConstraints() {
        greeting.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview().inset(20)
        }

        nameField.snp.makeConstraints { make in
            make.top.equalTo(greeting.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
}

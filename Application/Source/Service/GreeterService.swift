// GreeterService.swift
class GreeterService {
    enum Language {
        case english
        case spanish
    }

    private let language: Language

    init(language: Language) {
        self.language = language
    }

    func greet(user: String) -> String {
        // We are not greeting an empty string
        guard !user.isEmpty else { return "" }
        switch language {
        case .english:
            return "Hello \(user)!"
        case .spanish:
            return "¡Hola \(user)!"
        }
    }
}

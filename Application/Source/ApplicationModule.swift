// ApplicationModule.swift (in Application target)
final class ApplicationModule: DependencyModule {
    let userService: UserService = AnUserServiceImplementation()
    var anotherService: AnotherService {
        return AnAnotherServiceImplementation()
    }

    func greeterService(language: GreeterService.Language) -> GreeterService {
        return GreeterService(language: language)
    }
}

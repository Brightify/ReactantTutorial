// DependencyModule.swift
protocol DependencyModule {
    var userService: UserService { get }
    var anotherService: AnotherService { get }

    func greeterService(language: GreeterService.Language) -> GreeterService
}

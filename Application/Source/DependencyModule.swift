// DependencyModule.swift
protocol DependencyModule {
    func greeterService(language: GreeterService.Language) -> GreeterService
}

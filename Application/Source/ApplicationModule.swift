// ApplicationModule.swift (in Application target)
final class ApplicationModule: DependencyModule {
    func greeterService(language: GreeterService.Language) -> GreeterService {
        return GreeterService(language: language)
    }
}

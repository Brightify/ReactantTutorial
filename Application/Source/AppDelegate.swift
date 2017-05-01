// AppDelegate.swift
import UIKit

@UIApplicationMain
class AppDelegate : UIResponder, UIApplicationDelegate {
    var window : UIWindow?

    private let module = ApplicationModule()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]?) -> Bool {
        let window = UIWindow()
        let wireframe = MainWireframe(module: module)
        window.rootViewController = wireframe.entrypoint()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

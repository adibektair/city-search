//
//  AppDelegate.swift
//  City-Search
//
//  Created by tair on 26.03.22.
//

import UIKit
enum App {
    static var shared: UIApplication        { UIApplication.shared }
    static var delegate: AppDelegate        { shared.delegate as! AppDelegate }
    static var coordinator: Coordinator     { delegate.coordinator }
    static var window: UIWindow?            { delegate.window }
}
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var coordinator = Coordinator()
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let factory = Factory(coordinator: coordinator)
        coordinator.factory = factory
        coordinator.start()
        return true
    }
}


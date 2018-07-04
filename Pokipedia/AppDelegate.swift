//
//  AppDelegate.swift
//  Pokipedia
//
//  Created by Haoxin Li on 7/1/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import UIKit
import PokipediaFoundation

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    let window = UIWindow(frame: UIScreen.main.bounds)
    let mainSceneController = PokemonListSceneController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window.rootViewController = mainSceneController.navigationController
        window.makeKeyAndVisible()
        return true
    }
}

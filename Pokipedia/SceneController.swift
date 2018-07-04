//
//  SceneController.swift
//  Pokipedia
//
//  Created by Haoxin Li on 7/3/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import UIKit

protocol SceneController: class {
    var viewController: UIViewController { get }
}

protocol NavigatingSceneController: SceneController {
    var navigationController: UINavigationController { get }
}

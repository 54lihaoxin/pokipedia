//
//  SceneController.swift
//  Pokipedia
//
//  Created by Haoxin Li on 7/3/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import UIKit

/// This `SceneController` is also known as Coordinator or FlowController, but I don't see any standard in the iOS community yet.
protocol SceneController: class {
    var viewController: UIViewController { get }
}

/*
 I first saw the discussion for the "Back Buttons and Coordinators" kind of discussion from Soroush Khanlou:
    http://khanlou.com/2017/05/back-buttons-and-coordinators/
 I think the delegate approach is a better way as well, but the there are some drawbacks and challenges for the actual implementation, such as
 `removePushedNavigationSceneController` has to be duplicated for all `NavigationSceneController` just to set `pushedNavigationSceneController`
 to nil, and some scenes can be the root of the navigation stack in some cases while being pushed in other cases.
 */
protocol NavigationSceneController: SceneController {
    var navigationController: UINavigationController { get }
    var pushedNavigationSceneController: NavigationSceneController? { get }
    
    func handleNavigationDidShowViewController(_ viewController: UIViewController)
    func removePushedNavigationSceneController()
}

protocol RootNavigationSceneController: NavigationSceneController, UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool)
}

extension NavigationSceneController {
    
    func handleNavigationDidShowViewController(_ viewController: UIViewController) {
        guard let pushedNavigationSceneController = pushedNavigationSceneController else {
            return
        }
        if self.viewController == viewController {
            removePushedNavigationSceneController()
        } else {
            pushedNavigationSceneController.handleNavigationDidShowViewController(viewController)
        }
    }
}

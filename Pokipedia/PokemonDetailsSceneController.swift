//
//  PokemonDetailsSceneController.swift
//  Pokipedia
//
//  Created by Haoxin Li on 7/4/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import PokipediaFoundation
import UIKit

final class PokemonDetailsSceneController: NSObject, NavigationSceneController {
    
    var viewController: UIViewController {
        return _vc
    }
    
    unowned let navigationController: UINavigationController
    private(set) var pushedNavigationSceneController: NavigationSceneController?
    
    private let pokemon: Pokemon
    private lazy var _vc = PokemonDetailsViewController(pokemon: pokemon)
    
    init(pokemon: Pokemon, navigationController: UINavigationController) {
        self.pokemon = pokemon
        self.navigationController = navigationController
    }
    
    func removePushedNavigationSceneController() {
        pushedNavigationSceneController = nil
    }
}

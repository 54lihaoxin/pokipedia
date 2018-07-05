//
//  PokemonListSceneController.swift
//  Pokipedia
//
//  Created by Haoxin Li on 7/3/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import PokipediaFoundation
import UIKit

final class PokemonListSceneController: NSObject, RootNavigationSceneController {
    
    var viewController: UIViewController {
        return _vc
    }
    
    private(set) var pushedNavigationSceneController: NavigationSceneController?
    private(set) lazy var navigationController: UINavigationController = {
        let nav = UINavigationController(rootViewController: viewController)
        nav.delegate = self
        return nav
    }()
    private lazy var _vc = PokemonListViewController(pokemons: PokemonDataManager.shared.pokemons, delegate: self)
    
    func removePushedNavigationSceneController() {
        pushedNavigationSceneController = nil
    }
}

extension PokemonListSceneController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        handleNavigationDidShowViewController(viewController)
    }
}

extension PokemonListSceneController: PokemonListViewControllerDelegate {
    
    func selectPokemon(_ pokemon: Pokemon) {
        let nextSceneController = PokemonDetailsSceneController(pokemon: pokemon, navigationController: navigationController)
        navigationController.pushViewController(nextSceneController.viewController, animated: true)
        pushedNavigationSceneController = nextSceneController
    }
}

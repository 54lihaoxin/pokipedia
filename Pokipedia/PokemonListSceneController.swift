//
//  PokemonListSceneController.swift
//  Pokipedia
//
//  Created by Haoxin Li on 7/3/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import PokipediaFoundation
import UIKit

final class PokemonListSceneController: NavigatingSceneController {
    
    var viewController: UIViewController {
        return _vc
    }
    
    private(set) lazy var navigationController: UINavigationController = {
        return UINavigationController(rootViewController: viewController)
    }()
    
    private lazy var _vc: PokemonListViewController = {
        PokemonListViewController(pokemons: PokemonDataManager.shared.pokemons, delegate: self)
    }()
}

extension PokemonListSceneController: PokemonListViewControllerDelegate {
    
    func selectPokemon(_ pokemon: Pokemon) {
        print("\(#function) pokemon:", pokemon) // TODO
    }
}

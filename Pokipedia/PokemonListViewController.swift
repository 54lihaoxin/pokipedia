//
//  PokemonListViewController.swift
//  Pokipedia
//
//  Created by Haoxin Li on 7/3/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import PokipediaFoundation
import UIKit

protocol PokemonListViewControllerDelegate: class {
    func selectPokemon(_ pokemon: Pokemon)
}

class PokemonListViewController: UIViewController {
    
    private let pokemons: [Pokemon]
    private unowned let delegate: PokemonListViewControllerDelegate
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    init(pokemons: [Pokemon], delegate: PokemonListViewControllerDelegate) {
        self.pokemons = pokemons
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        title = "Pokemons"
    }
}

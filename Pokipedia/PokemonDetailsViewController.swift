//
//  PokemonDetailsViewController.swift
//  Pokipedia
//
//  Created by Haoxin Li on 7/4/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import PokipediaFoundation
import UIKit

final class PokemonDetailsViewController: UIViewController {
    
    fileprivate let pokemon: Pokemon
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        super.init(nibName: nil, bundle: nil)
        title = pokemon.name
        view.backgroundColor = .orange
    }
}

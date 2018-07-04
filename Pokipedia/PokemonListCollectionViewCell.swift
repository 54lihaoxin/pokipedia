//
//  PokemonListCollectionViewCell.swift
//  Pokipedia
//
//  Created by Haoxin Li on 7/3/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import PokipediaFoundation
import UIKit

final class PokemonListCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PokemonListCollectionViewCell"

    fileprivate var pokemon: Pokemon?
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8
        clipsToBounds = true
    }
}

// MARK: - API

extension PokemonListCollectionViewCell {
    
    func configure(with pokemon: Pokemon) {
        self.pokemon = pokemon
        titleLabel.text = pokemon.description
    }
}

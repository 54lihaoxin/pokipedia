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
    
    fileprivate let pokemons: [Pokemon]
    fileprivate unowned let delegate: PokemonListViewControllerDelegate
    
    fileprivate lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .white
        cv.register(UINib(nibName: PokemonListCollectionViewCell.className, bundle: nil),
                    forCellWithReuseIdentifier: PokemonListCollectionViewCell.reuseIdentifier)
        return cv
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    init(pokemons: [Pokemon], delegate: PokemonListViewControllerDelegate) {
        self.pokemons = pokemons
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        title = "Pokemons"
    }
    
    override func loadView() {
        super.loadView()
        initialViewSetup()
    }
}

// MARK: - UICollectionViewDataSource

extension PokemonListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: PokemonListCollectionViewCell.reuseIdentifier, for: indexPath)
    }
}

// MARK: - UICollectionViewDelegate

extension PokemonListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? PokemonListCollectionViewCell else {
            fatalError("\(#function) cell is not `PokemonListCollectionViewCell` as expected")
        }
        cell.configure(with: pokemons[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.selectPokemon(pokemons[indexPath.row])
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PokemonListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}

// MARK: - private helpers

private extension PokemonListViewController {
    
    /// This should be called only once in `loadView`.
    func initialViewSetup() {
        view.addSubview(collectionView)
        collectionView.activateLayoutAnchorsWithSuperView()
    }
}

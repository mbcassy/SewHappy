//
//  FabricView.swift
//  SewHappy
//
//  Created by Cassy on 3/6/21.
//

import UIKit

class FabricView: UIView {

    weak var fabricCollectionView: UICollectionView!
    weak var cvTitle: UILabel!
    weak var addButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubviews()
    }
    
    private func createSubviews() {
        let padding:CGFloat = 85
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: padding),
            textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        textLabel.text = "Fabric Stash"
        self.cvTitle = textLabel
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.cvTitle.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        self.fabricCollectionView = collectionView
        
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        //TODO: Edit these constraints so that the button resizes to the correct proportions for each device
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 75),
            button.heightAnchor.constraint(equalToConstant: 75),
            button.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])

        button.clipsToBounds = true
        button.backgroundColor = .none
        button.tintColor = .systemPink
        //TODO: edit this so that the button image does not go to the edge of button.
        // Basically make the button image smaller than button.
        button.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        
        self.addButton = button
        
        self.fabricCollectionView.backgroundColor = .white
        self.fabricCollectionView.alwaysBounceVertical = true
    }
}

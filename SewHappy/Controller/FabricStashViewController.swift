//
//  ViewController.swift
//  SewHappy
//
//  Created by Cassy on 2/23/21.
//

import UIKit

class FabricStashViewController: UIViewController {

    weak var fabricCollectionView: UICollectionView!
    weak var cvTitle: UILabel!
    weak var addButton: UIButton!
    
    var data: [Int] = Array(0..<10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fabricCollectionView.backgroundColor = .white
        self.fabricCollectionView.dataSource = self
        self.fabricCollectionView.delegate = self
        self.fabricCollectionView.register(FabricCell.self, forCellWithReuseIdentifier: FabricCell.identifier)
        self.fabricCollectionView.alwaysBounceVertical = true
    }
    
    override func loadView() {
        super.loadView()
        
        let padding:CGFloat = 85
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: padding),
            textLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        textLabel.text = "Fabric Stash"
        self.cvTitle = textLabel
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.cvTitle.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        self.fabricCollectionView = collectionView
        
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        //TODO: Edit these constraints so that the button resizes to the correct proportions for each device
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 75),
            button.heightAnchor.constraint(equalToConstant: 75),
            button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])

        button.clipsToBounds = true
        button.backgroundColor = .black
        //edit this so that the button image does not go to the edge of button. Basically make the button image smaller than button
        button.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        
        self.addButton = button
    }
    
    override func viewDidLayoutSubviews() {
        self.addButton.layer.cornerRadius = 0.5 * self.addButton.bounds.size.width
    }
}

extension FabricStashViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //TODO: Edit this with the amount of items in your fabric stash
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FabricCell.identifier, for: indexPath) as! FabricCell
             
        //TODO: Edit this for actual data
        let data = self.data[indexPath.item]
        cell.textLabel.text = String(data)
        cell.backgroundColor = .blue
        return cell
    }
}

extension FabricStashViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension FabricStashViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 16
        let spacing:CGFloat = 16

        let totalSpacing = (2 * spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        if let collection = self.fabricCollectionView {
            let width = (collection.bounds.width - totalSpacing) / numberOfItemsPerRow
            return CGSize(width: width, height: width)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let spacing:CGFloat = 16
        return UIEdgeInsets(top: spacing,left: spacing, bottom: spacing,right: spacing)
    }
}

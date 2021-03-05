//
//  ViewController.swift
//  SewHappy
//
//  Created by Cassy on 2/23/21.
//

import UIKit

class FabricStashViewController: UIViewController {

    weak var fabricCollectionView: UICollectionView!
    var data: [Int] = Array(0..<10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.fabricCollectionView.backgroundColor = .white
        self.fabricCollectionView.dataSource = self
        self.fabricCollectionView.delegate = self
        self.fabricCollectionView.register(FabricCell.self, forCellWithReuseIdentifier: FabricCell.identifier)
        self.fabricCollectionView.alwaysBounceVertical = true
    }
    
    override func loadView() {
        super.loadView()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: collectionView.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
        ])
        self.fabricCollectionView = collectionView
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

    //TODO: Fix this method to make perfectly square cells 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCols = CGFloat(2)
        let width = (collectionView.frame.size.width - (numberOfCols * view.frame.size.width / 15))/numberOfCols
        let height = collectionView.frame.size.height / 5
        return CGSize(width:width, height:height);
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidthPadding = collectionView.frame.size.width / 20
        let cellHeightPadding = collectionView.frame.size.height / 10
        return UIEdgeInsets(top: cellHeightPadding,left: cellWidthPadding, bottom: cellHeightPadding,right: cellWidthPadding)
    }
}

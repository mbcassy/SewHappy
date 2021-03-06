//
//  FabricStashViewController.swift
//  SewHappy
//
//  Created by Cassy on 2/23/21.
//

import UIKit

class FabricStashViewController: UIViewController {

    private var mainView = FabricView()
    private var fabricDataDelegateSource = ObjectDataDelegateSource()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.fabricCollectionView.dataSource = fabricDataDelegateSource
        self.mainView.fabricCollectionView.delegate = fabricDataDelegateSource
        self.mainView.fabricCollectionView.register(FabricCell.self, forCellWithReuseIdentifier: FabricCell.identifier)
    }
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLayoutSubviews() {
        self.mainView.addButton.layer.cornerRadius = 0.5 * self.mainView.addButton.bounds.size.width
    }
}

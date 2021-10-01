//
//  ProjectsViewController.swift
//  SewHappy
//
//  Created by Cassy on 3/4/21.
//

import UIKit

class ProjectsViewController: UIViewController {

    private var mainView = FabricCollectionView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.mainView.fabricCollectionView.dataSource = self
        //self.mainView.fabricCollectionView.delegate = self
        self.mainView.fabricCollectionView.register(FabricCell.self, forCellWithReuseIdentifier: FabricCell.identifier)
    }
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLayoutSubviews() {
        self.mainView.addButton.layer.cornerRadius = 0.5 * self.mainView.addButton.bounds.size.width
    }}

//
//  ProjectsViewController.swift
//  SewHappy
//
//  Created by Cassy on 3/4/21.
//

import UIKit

class ProjectsViewController: UIViewController {

    private var mainView = FabricView()
    private var projectsDataDelegateSource = ObjectDataDelegateSource()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.fabricCollectionView.dataSource = projectsDataDelegateSource
        self.mainView.fabricCollectionView.delegate = projectsDataDelegateSource
        self.mainView.fabricCollectionView.register(FabricCell.self, forCellWithReuseIdentifier: FabricCell.identifier)
    }
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLayoutSubviews() {
        self.mainView.addButton.layer.cornerRadius = 0.5 * self.mainView.addButton.bounds.size.width
    }}

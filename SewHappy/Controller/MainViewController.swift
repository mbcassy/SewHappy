//
//  MainViewController.swift
//  SewHappy
//
//  Created by Cassy on 3/4/21.
//

import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        view.backgroundColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        //TODO: Possibly move all this code to the scene delegate
        super.viewWillAppear(animated)
        
        let fabricTab = FabricStashViewController()
        let fabricTabBarItem = UITabBarItem(title: "Stash", image: UIImage(systemName: "scissors"), selectedImage: UIImage(systemName: "scissors"))
        fabricTab.tabBarItem = fabricTabBarItem
        
        let projectsTab = ProjectsViewController()
        let projectsTabBarItem = UITabBarItem(title: "Projects", image: UIImage(systemName: "folder.fill"), selectedImage: UIImage(systemName: "folder.fill"))
        projectsTab.tabBarItem = projectsTabBarItem
        
        let settingsTab = SettingsViewController()
        let settingsTabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape.2.fill"), selectedImage: UIImage(systemName: "gearshape.2.fill"))
        settingsTab.tabBarItem = settingsTabBarItem
        
        let controllers = [fabricTab, projectsTab, settingsTab]
        self.viewControllers = controllers
    }
}

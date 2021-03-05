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
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func viewWillAppear(_ animated: Bool) {
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
        
        self.viewControllers = [fabricTab, projectsTab, settingsTab]
    }
}

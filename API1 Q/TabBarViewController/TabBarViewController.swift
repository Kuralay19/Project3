//
//  TabBarViewController.swift
//  API1 Q
//
//  Created by Smart Castle M1A2004 on 14.04.2024.
//
import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: MainViewController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Main", imageName: "home_icon"),
            createNavController(viewController: DiscoverViewController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Discover", imageName: "discover_icon"),
           // createNavController(viewController: ProfileViewController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Profile", imageName: "profile_icon")
        ]
    }
    func createNavController(viewController: UIViewController, title: String, imageName: String) ->
    UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        
        return navController
    }
}





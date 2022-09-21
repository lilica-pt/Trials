//
//  MainTabViewController.swift
//  MeLiApp
//
//  Created by Lili Cabral on 13/09/22.
//

import UIKit

class MainMenuViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = .darkGray
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .systemBackground
        viewControllers = [goToHome(), goToFavorites(), goToShop(), goToNotification(), goToMore()]
    }
    
    func goToHome() -> UINavigationController {
        let homeViewController = HomeViewController()
        let navigation = configureNavController(rootViewController: homeViewController)
        navigation.tabBarItem = UITabBarItem(title: "Início", image: UIImage(systemName: "house"), tag: 0)
        
        return navigation
    }

    func goToFavorites() -> UIViewController {
        let favoritesViewController = UINavigationController(rootViewController: FavoritesViewController())
        favoritesViewController.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(systemName: "heart"), tag: 1)
        
        return favoritesViewController
    }

    func goToShop() -> UIViewController {
        let shopViewController = ShopViewController()
        shopViewController.tabBarItem = UITabBarItem(title: "Minhas Compras", image: UIImage(systemName: "bag"), tag: 2)
        
        return shopViewController
    }

    func goToNotification() -> UIViewController {
        let noteViewController = NotificationViewController()
        noteViewController.tabBarItem = UITabBarItem(title: "Notificações", image: UIImage(systemName: "bell"), tag: 3)
        
        return noteViewController
    }

    func goToMore() -> UIViewController {
        let moreViewController = MoreViewController()
        moreViewController.tabBarItem = UITabBarItem(title: "Mais", image: UIImage(systemName: "text.justify"), tag: 4)
        
        return moreViewController
    }

    func configureNavController(rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        let apparence = UINavigationBarAppearance()
        apparence.backgroundColor = UIColor(.yellow)

        navigationController.navigationController?.navigationBar.standardAppearance = apparence
        navigationController.navigationController?.navigationBar.scrollEdgeAppearance = apparence

        return navigationController
    }
    
}

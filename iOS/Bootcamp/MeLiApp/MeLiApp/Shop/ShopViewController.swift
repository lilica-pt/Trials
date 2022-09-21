//
//  ShopViewController.swift
//  MeLiApp
//
//  Created by Lili Cabral on 13/09/22.
//

import UIKit

class ShopViewController: UIViewController, UISearchBarDelegate {
    
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchBar)
        searchBar.delegate = self
        configureSearchBar()
        self.title = "Minhas Compras"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor = .label
        self.navigationItem.title = "Início"
        
        view.backgroundColor = .systemBackground
        
        let apparence = UINavigationBarAppearance()
        apparence.backgroundColor = UIColor(.yellow)
        navigationController?.navigationBar.standardAppearance = apparence
        navigationController?.navigationBar.scrollEdgeAppearance = apparence
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchBar.frame = view.bounds
    }
    
    func configureSearchBar() {
        view.backgroundColor = .label
        
        searchBar.sizeToFit()
        searchBar.showsCancelButton = false
        searchBar.barTintColor = .systemYellow
        searchBar.placeholder = "Buscar no Mercado Livre"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.tintColor = .gray
        
        navigationItem.titleView = searchBar
        navigationItem.leftBarButtonItem = nil
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .white
    }
    
}

//
//  ViewController.swift
//  simpleSearchBar
//
//  Created by Lili Cabral on 15/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    let searchController = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
    }


}


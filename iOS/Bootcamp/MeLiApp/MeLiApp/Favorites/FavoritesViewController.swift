//
//  FavoritesViewController.swift
//  MeLiApp
//
//  Created by Lili Cabral on 15/09/22.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var tableView = UITableView()
    var favList: [FavoritesStruct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let setBarButton = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: nil)
        let setBarButton2 = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
        self.navigationItem.setRightBarButtonItems([setBarButton, setBarButton2], animated: true)
        let apparence = UINavigationBarAppearance()
        apparence.backgroundColor = UIColor(.yellow)
        navigationController?.navigationBar.standardAppearance = apparence
        navigationController?.navigationBar.scrollEdgeAppearance = apparence
        self.title = "Favoritos"
        
        favList = fetchData()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 120
        tableView.register(FavoritesViewCell.self, forCellReuseIdentifier: "cell")
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func fetchData() -> [FavoritesStruct] {
        let image1 = FavoritesStruct(image: FavoritesLib.scooter, title: "Patinete Elétrico")
        let image2 = FavoritesStruct(image: FavoritesLib.tv, title: "Televisor 40 polegadas")
        let image3 = FavoritesStruct(image: FavoritesLib.phone, title: "Smartphone")
        let image4 = FavoritesStruct(image: FavoritesLib.iphone, title: "iPhone 12 128Gb")
        
        return [image1, image2, image3, image4]
    }
    
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! FavoritesViewCell
        let image = favList[indexPath.row]
        cell.set(imageSet: image)
        
        return cell
    }
}

extension UIView {
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

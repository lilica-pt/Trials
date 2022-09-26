//
//  ViewController.swift
//  simpleCarousel
//
//  Created by Lili Cabral on 26/09/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CollectionTableViewCell.self,
                       forCellReuseIdentifier: CollectionTableViewCell.identifier)
        
        return table
    }()
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(
            viewModels: [
                TileCollectionViewCellViewModel(name: "Apple", backgroundColor: .systemPink),
                TileCollectionViewCellViewModel(name: "Apple2", backgroundColor: .systemBlue),
                TileCollectionViewCellViewModel(name: "Apple3", backgroundColor: .systemYellow),
                TileCollectionViewCellViewModel(name: "Apple4", backgroundColor: .systemRed),
                TileCollectionViewCellViewModel(name: "Apple5", backgroundColor: .systemGreen)
            ]
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier,
                                                       for: indexPath) as? CollectionTableViewCell else {
            fatalError()
        }
        cell.delegate = self
        cell.configue(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width/2
    }
}

extension ViewController: CollectionTableViewCellDelegate {
    func collectionTableViewCellDidTapItem(with viewModel: TileCollectionViewCellViewModel) {
        let alert = UIAlertController(title: viewModel.name,
                                      message: "Promoção selecionada!",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}

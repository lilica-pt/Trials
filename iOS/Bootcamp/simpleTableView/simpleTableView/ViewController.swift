//
//  ViewController.swift
//  simpleTableView
//
//  Created by Lili Cabral on 14/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self, // 1 // 6
                           forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor =  .systemYellow
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        view.addSubview(tableView)
    }

    override func viewDidLayoutSubviews() { // 2
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds // 3
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate { // 5
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, // 6
                                                 for: indexPath)
        as? CustomTableViewCell else { // 8
            return UITableViewCell()
        }
        
        cell.configure(text: "iPhone 12 \(indexPath.row+1)",
                       imageName: "iphone12a")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { // 7
        return 100
    }
}

// 1 quando customizar a tv, tem que registrá-la por padrão, aqui está uma classe básica - UITableViewCell e "cell"
// 2 sobrescrever o layout da view
// 3 o layout será igual ao da tela da view
// 4 implementando o datasource
// 5 config básica, os protocolos deverão ser incluídos junto a classe e colocar a função de implementação - numberofrows e cellforrow
// 6 após criar a configuração básica da célula em CustomTableViewCell, alterar os nomes para que ela possa ser chamada
// 7 o conteúdo é relativizado, por isso, vamos formatá-lo usando o delegate
// 8 elenca a CustomTableViewCell, caso contrário, exibe uma padrão

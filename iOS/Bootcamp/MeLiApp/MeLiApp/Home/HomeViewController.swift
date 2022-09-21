//
//  ViewController.swift
//  MeLiApp
//
//  Created by Lili Cabral on 12/09/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    let searchBar = UISearchBar()
    var searchText = ""
    
    private var sections = [SectionType]() // 10
    
    private let tableView: UITableView = { // 1
        let table = UITableView() // 2
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // 2
        table.register(PhotoCarouselTableViewCell.self, forCellReuseIdentifier: PhotoCarouselTableViewCell.identifier) // 14
        table.register(HistoryProductTableViewCell.self, forCellReuseIdentifier: HistoryProductTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSections() // 11
        view.addSubview(tableView)  // 3
        tableView.delegate = self // 4
        tableView.dataSource = self // 5
        searchBar.delegate = self
        configureSearchBar()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(rightButtonTapped))
        self.navigationItem.rightBarButtonItem?.tintColor = .black
        self.navigationItem.title = "Início"
        
        let apparence = UINavigationBarAppearance()
        apparence.backgroundColor = UIColor(.yellow)
        
        navigationController?.navigationBar.standardAppearance = apparence
        navigationController?.navigationBar.scrollEdgeAppearance = apparence
    }
    
    override func viewDidLayoutSubviews() { // 7
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureSections() { // 11
        sections.append(.productPhotos(images: [ // 18
            UIImage(named: "publi1"),
            UIImage(named: "publi2"),
            UIImage(named: "publi3")
                                               ].compactMap({$0}))
        )
        sections.append(.productInfo(viewModels: [
            TextCellViewModel(text: "Frete grátis em milhares de produtos a partir de R$ 79", font: .systemFont(ofSize: 12))
        ]))
        sections.append(.historyProducts(viewModels: [
            HistoryProductTableViewCellViewModel(image: UIImage(named: "visto1"), title: "Patinete Elétrico Scooter Até 30km/hora Fácil De Transportar"),
            HistoryProductTableViewCellViewModel(image: UIImage(named: "visto2"), title: "Monitor gamer LG UltraWide 29WL500 led 29 preto 100V/240V"),
            HistoryProductTableViewCellViewModel(image: UIImage(named: "visto3"), title: "Moto E20 Dual SIM 32 GB cinza 2 GB RAM")
        ]))
    }
    
    @objc func rightButtonTapped() {
        let shopViewController = ShopViewController()
        shopViewController.title = searchText
        navigationController?.pushViewController(shopViewController, animated: true)
    }
    
    func configureSearchBar() {
        view.backgroundColor = .white
        
        searchBar.sizeToFit()
        searchBar.showsCancelButton = false
        searchBar.barTintColor = .label
        searchBar.placeholder = "Buscar no Mercado Livre"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.tintColor = .gray
        
        navigationItem.titleView = searchBar
        navigationItem.leftBarButtonItem = nil
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { // 12
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 6
        let sectionType = sections[section] // 26
        switch sectionType {
        case .productPhotos:
            return 1
        case .productInfo(let viewModels):
            return viewModels.count
        case .historyProducts(let viewModels):
            return viewModels.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { // 25
        let sectionType = sections[section]
        return sectionType.title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = sections[indexPath.section] // 15
        switch sectionType {
        case .productPhotos(let images): // 20
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PhotoCarouselTableViewCell.identifier,
                for: indexPath) as? PhotoCarouselTableViewCell else {
                fatalError()
            } // 16
            cell.configure(with: images)
            return cell
        case .productInfo(let viewModels):
            let viewModel = viewModels[indexPath.row] // 23
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "cell",
                for: indexPath
            )
            cell.configure(width: viewModel) // 23
            return cell
        case .historyProducts( let viewModels):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: HistoryProductTableViewCell.identifier,
                for: indexPath) as? HistoryProductTableViewCell else {
                fatalError()
            }
            cell.configure(width: viewModels[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { // 21
        let sectionType = sections[indexPath.section]
        switch sectionType {
        case .productPhotos:
            return 200
        case .productInfo, .historyProducts:
            return UITableView.automaticDimension // 22
        }
    }
}

// 1 para criar um carrossel que deslize horizontalmente com as fotos do produto, bem como a descrição, é necessário o uso da TableView com células customizadas
// 2 criando, registrando e identificando uma TV básica
// 3 adicionando a lista de visuaizações
// 4 delegate = responsável por responder suas ações ao selecionar/desselecionar
// 5 datasource = responsável por receber dados para exibir as informações de acordo com o número de linhas da sessão
// 6 os protocolos deverão ser incluídos junto a classe e colocar a função de implementação - numberofrows e cellforrow
// 7 organizando a lista de subviews
// 8 dequeue = desinfileirar
// 9 definindo e modelando a estrutura dos dados
// 10 para representar as diversas sessões, instanciando como uma array vazia
// 11 função para popular as sessões
// 12 implementando a quantidade de linhas de acordo com o que é fornecido pela API - numbersofsections
// 13 criar uma tableviewcell com cocoa para representar cada um dos componentes - PhotoCarouselTableViewCell
// 14 para registrar a célula criada no outro arquivo na vc
// 15 o tipo de sessão da qual queremos obter as informações
// 16 elencando PhotoCarouselTableViewCell como a reposta apropriada para este caso
// 17 essa estrutura receberá imagens
// 18 monte (configure) com imagens
// 19 certifica que essa array não tem opcionais e valida que as fotos existem
// 20 exibindo o array de imagens que serão passadas via func por PhotoCarouselTableViewCell
// 21 heightforrowatindex, criando o dimensionamento para cada sessão
// 22 do contrário, retorne um autolayout. O layout deve ser implementado em PhotoCarouselTableViewCell
// 23 do array de viewModel me dê a posição da célula e configure ela como viewModel
// 24 computed property = calcula sua propriedade mediante solicitação
// 25 para padronizar o campo para retornar o texto caso seja deste tipo, do contrário, nulo
// 26 obtendo o tipo da seção, para que ele diga em qual estamos para determinar a quantidade de linhas

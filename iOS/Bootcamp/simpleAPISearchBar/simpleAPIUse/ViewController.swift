//
//  ViewController.swift
//  simpleAPIUse
//
//  Created by Lili Cabral on 19/09/22.
//

import UIKit

struct APIResponse: Codable { // 5
    let total: Int
    let total_pages: Int
    let results: [Result]
}

struct Result: Codable {
    let id: String
    let urls: URLS
}

struct URLS: Codable {
    let regular: String
}

class ViewController: UIViewController, UICollectionViewDataSource, UISearchBarDelegate {
    
    private var collectionView: UICollectionView? // 8
    
    var results: [Result] = []
    
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchBar)
        searchBar.delegate = self
        let layout = UICollectionViewFlowLayout() // 9
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width/2,
                                 height: view.frame.size.width/2)
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(ImageCollectionViewCell.self,
                                forCellWithReuseIdentifier: "ImageCollectionViewCell")
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        self.collectionView = collectionView
    }
    
    override func viewDidLayoutSubviews() { // 10
        super.viewDidLayoutSubviews()
        searchBar.frame = CGRect(x: 10, y: view.safeAreaInsets.top, width: view.frame.size.width-20, height: 50)
        collectionView?.frame = CGRect(x: 0, y: view.safeAreaInsets.top+55, width: view.frame.size.width, height: view.frame.size.height-55)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageURLString = results[indexPath.row].urls.regular // 11
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier,
                                                      for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: imageURLString)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            results = []
            collectionView?.reloadData() // 12
            fetchPhotos(query: text)
        }
    }
    
    func fetchPhotos(query: String) {
        let url = "https://api.unsplash.com/search/photos?page1&query=\(query)&client_id=LUS2TaSA3jAH-H-lgTr0uUPJSRLLPQHQu6Vc8LWbArQ" // 1
        guard let url = URL(string: url) else { return } // 2
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in // 3 // 7
            guard let data = data, error == nil else {  // 4
                return
            }
            do {
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data) // 6
                DispatchQueue.main.async {
                    self?.results = jsonResult.results
                    self?.collectionView?.reloadData()
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

// 1 client_id é a minha chave
// 2 certificar que a url é válida
// 3 underscore para ignorar o tipo de resposta que será retornada
// 4 desembrulha data e confirma que a quantidade de bytes recebidos está correta, o erro será nulo indicando que a requisição foi bem sucedida
// 5 "traduz" o json, para isso, listamos as chaves e os tipos do arquivo
// 6 se puder, tente decodificar o dado em um das nossas estruturas de api
// 7 evitar disperdício de memória, a linha 43 tem um self opcional
// 8 para criar uma coleção com as fotos
// 9 é um layout para a view
// 10 vamos sobrescrever esse layout para a collection que tem os limites da view
// 11 fazer uma célula customizada ImageCollectionViewCell para onde passaremos os resultados para que baixem as imagens e sejam exibidas de acordo com a id de fotos da estrutura (regular)
// 12 limpa a pesquisa anterior

//
//  PhotoCarouselTableViewCell.swift
//  MeLiApp
//
//  Created by Lili Cabral on 12/09/22.
//

import UIKit

class PhotoCarouselTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {    // 16
    
    static let identifier = "PhotoCarouselTableViewCell" // 14
    
    private let collectionView: UICollectionView = { // 5
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // 7
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout) // 8
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell") // 9
        
        return collectionView
    }()
    
    private var images = [UIImage]() // 15
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier) // 2
        collectionView.backgroundColor = .systemBackground
        contentView.addSubview(collectionView) // 10
        collectionView.delegate = self // 11
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) { // 3
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds // 13
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoCollectionViewCell.identifier,
            for: indexPath
        ) as? PhotoCollectionViewCell else {
            fatalError()
        }
        cell.configure(width: images[indexPath.row])
        return cell
    }
    
    public func configure(with images: [UIImage]) { // 15
        self.images = images
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { // 17
        return CGSize(width: contentView.frame.size.width,
                      height: contentView.frame.size.width)
    }
    
}

// 1 deletar o conteúdo e incluir um init com style
// 2 construtor
// 3 o sistema mesmo pede para colocar
// 4 determina o dimensionamento automático para retângulos
// 5 criando uma coleção para o carrossel dentro dessa célula, com rolagem horizontal,
// 6 closure anônima
// 7 padding das laterais da sessão
// 8 por fim, criando a collectionview
// 9 registrando a célula, referenciando a criada na vc
// 10 adicionando a célula como uma subview
// 11 básico: implementar protocolos à classe e trazer suas funções base
// 12 novamente, padrão
// 13 completando toda a célula
// 14 para registrar essa célula na vc (volta lá rs)
// 15 após obter as imagens, vamos instanciá-la em um array global
// 16 protocolo de implementação do layout padrão
// 17 sizeforitem, que nesse caso, será do tamanho da largura que, colocado como altura, será um quadrado
// 18 criar um cocoatouch para uma custom collection view cell que guardará as imagens - PhotoCollectionViewController
// 19 pegue as imagens do array de images

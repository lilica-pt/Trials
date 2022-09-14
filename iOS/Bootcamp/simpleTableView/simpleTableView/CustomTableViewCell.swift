//
//  CustomTableViewCell.swift
//  simpleTableView
//
//  Created by Lili Cabral on 14/09/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell" // 1
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 17, weight: .light)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) { // 2
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground // 3
        contentView.translatesAutoresizingMaskIntoConstraints = false
        // contentView.addSubview(_switch) // 5
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(text: String, imageName: String) { // 10
        myLabel.text = text
        myImageView.image = UIImage(named: imageName)
        myImageView.contentMode = .scaleAspectFit
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
        myImageView.image = nil
        
    }
    
    func setUpConstraints() {
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myImageView.widthAnchor.constraint(equalToConstant: 40),
            myImageView.topAnchor.constraint(equalTo: topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            myImageView.heightAnchor.constraint(equalToConstant: 100),
            
            myLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor),
            myLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            myLabel.topAnchor.constraint(equalTo: topAnchor),
            myLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}

// 1 toda a célula precisa ser registrada na tv, por isso, tem que ser identificada
// 2 sobescrever o inicializador para que as configurações de layout possam aparecer
// 3 boa prática colocar dentro da contentView, pois outros ajustes poderão ser feitos como o padding que afetam somente o conteúdo
// 4 botão adicionado sem rótulos, pois é uma palavra usada pelo sistema
// 5 adicionando ela como subView
// 6 configurando o layout
// 7 ajustar caso use o switch
// 8 para formar um quadrado orientado pela altura da célula na imagem
// 9 centralizar o botão
// 10 parametrizando nomes e imagens








//    private let _switch: UISwitch = { // 4
//        let _switch = UISwitch()
//        _switch.tintColor = .blue
//        _switch.isOn = true
//        return _switch
//    }()



//    override func layoutSubviews() { // 6
//        super.layoutSubviews()
//
//         let switchSize = _switch.sizeThatFits(contentView.frame.size) // 9
//                _switch.frame = CGRect(x: 5,
//                                       y: 5,
//                                       width: 100,
//                                       height: contentView.frame.size.height-10)
//
//        myImageView.frame = CGRect(x: 0,
//                                   y: contentView.frame.size.height-50,
//                                   width: contentView.frame.size.width-10,
//                                   height: 50)
//
//        myLabel.frame = CGRect(x: 5, // 7
//                               y: 0,
//                               width: contentView.frame.size.width-10, // 7 // 8
//                               height: contentView.frame.size.height-50)
//    }

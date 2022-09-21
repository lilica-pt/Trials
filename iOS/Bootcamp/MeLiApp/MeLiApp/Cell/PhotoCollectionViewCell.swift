//
//  PhotoCollectionViewCell.swift
//  MeLiApp
//
//  Created by Lili Cabral on 12/09/22.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotoCollectionViewCell"

    private let imageView: UIImageView = {
        let imageView = UIImageView() // 1
        imageView.contentMode = .scaleAspectFit // 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    public func configure(width image: UIImage) {
        imageView.image = image
    }
}

// 1 anonimous closure
// 2 para preencher toda a view

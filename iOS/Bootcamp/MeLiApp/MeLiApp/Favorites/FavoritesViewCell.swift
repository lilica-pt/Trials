//
//  FavoritesTableViewCell.swift
//  MeLiApp
//
//  Created by Lili Cabral on 15/09/22.
//

import UIKit

class FavoritesViewCell: UITableViewCell {
    
    var imageField = UIImageView()
    var labelField = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(imageField)
        addSubview(labelField)
        configureImage()
        configureLabel()
        setImageConstraints()
        setLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func set(imageSet: FavoritesStruct){
        imageField.image = imageSet.image
        labelField.text = imageSet.title
    }
    
    func configureImage() {
        imageField.layer.cornerRadius = 10
        imageField.clipsToBounds = true
    }
    
    func configureLabel() {
        labelField.numberOfLines = 0 // wrap
        labelField.adjustsFontSizeToFitWidth = true // shrink
    }
    
    func setImageConstraints() {
        imageField.translatesAutoresizingMaskIntoConstraints = false
        imageField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        imageField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageField.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setLabelConstraints() {
        labelField.translatesAutoresizingMaskIntoConstraints = false
        labelField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        labelField.leadingAnchor.constraint(equalTo: imageField.trailingAnchor, constant: 20).isActive = true
        labelField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        labelField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}

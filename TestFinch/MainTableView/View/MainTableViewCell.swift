//
//  MainTableViewCell.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 08.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

final class MenuTableViewCell: UITableViewCell {
    
    private let imagePerson: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        
        return lable
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawSelf() {
        
        contentView.addSubview(imagePerson)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
        let heighConstraint = imagePerson.heightAnchor.constraint(equalToConstant: 100)
        heighConstraint.priority = .defaultHigh
        heighConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            
            imagePerson.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imagePerson.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            imagePerson.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            imagePerson.widthAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: imagePerson.rightAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leftAnchor.constraint(equalTo: imagePerson.rightAnchor, constant: 20),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10)
        ])
    }
    
    func setup(title: String, description: String, image: UIImage) {
        titleLabel.text = title
        descriptionLabel.text = description
        imagePerson.image = image
    }
}

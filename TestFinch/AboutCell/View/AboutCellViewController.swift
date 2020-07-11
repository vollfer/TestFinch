//
//  AboutCellViewController.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 09.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol AboutCellViewOutput: ViewOutput {
    
}

final class AboutCellView: UIViewController {
    
    //MARK: - Properties
    
    var presenter: AboutCellViewOutput?
    
    private let imagePerson: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderWidth = 1
        label.textAlignment = .center
        label.backgroundColor = .white
        label.textColor = .black
        
        return label
    }()
    
    private let descriptionText: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 8
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.isEditable = false
        textView.backgroundColor = .white
        textView.textColor = .black
        
        return textView
    }()
    
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
        presenter?.viewIsReady()
    }
    
    private func drawSelf() {
        
        view.systemBackground()
        view.addSubview(imagePerson)
        view.addSubview(titleLabel)
        view.addSubview(descriptionText)
        
        NSLayoutConstraint.activate([
            
            imagePerson.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePerson.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -25),
            imagePerson.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            imagePerson.widthAnchor.constraint(equalToConstant: 250),
            
            
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            descriptionText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            descriptionText.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            descriptionText.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20)
        ])
    }
}

//MARK: - AboutCellInput
extension AboutCellView: AboutCellInput {
    func updateViewIfNeeded(with person: Person?) {
        titleLabel.text = person?.title
        descriptionText.text = person?.description
        imagePerson.image = person?.imagePerson
        title = person?.title
    }
}

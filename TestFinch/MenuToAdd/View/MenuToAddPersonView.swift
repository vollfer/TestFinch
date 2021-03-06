//
//  MenuToAddPersonView.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 08.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol MenuToAddPersonViewOutput {
    func didTadAddPerson(title: String, description: String, image: UIImage)
}

final class MenuToAddPersonView: UIViewController {
    
    //MARK: - Properties
    
    var presenter: MenuToAddPersonViewOutput?
    
    private let imagePerson: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "image")
        
        return imageView
    }()
    
    private let titleTextFild: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 4
        textField.autocapitalizationType = .none
        textField.backgroundColor = .white
        textField.textColor = .black
        
        return textField
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 4
        textView.autocapitalizationType = .none
        textView.backgroundColor = .white
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.textColor = .black
        
        return textView
    }()
    
    private let imageАctivityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        return indicator
    }()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
    }
    
    private func drawSelf() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(openGallary))
        imagePerson.addGestureRecognizer(tap)
        imagePerson.isUserInteractionEnabled = true
        
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(dismissKayboard(sender:)))
        tapScreen.cancelsTouchesInView = false
        
        titleTextFild.delegate = self
        
        view.systemBackground()
        title = "Новое поле"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Готово", style: .plain, target: self, action: #selector(addAttribute))
        
        view.addGestureRecognizer(tapScreen)
        view.addSubview(imagePerson)
        view.addSubview(titleTextFild)
        view.addSubview(descriptionTextView)
        view.addSubview(imageАctivityIndicator)
        
        NSLayoutConstraint.activate([
            
            imagePerson.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePerson.bottomAnchor.constraint(equalTo: titleTextFild.topAnchor, constant: -25),
            imagePerson.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            imagePerson.widthAnchor.constraint(equalToConstant: 250),
            
            imageАctivityIndicator.centerXAnchor.constraint(equalTo: imagePerson.centerXAnchor),
            imageАctivityIndicator.centerYAnchor.constraint(equalTo: imagePerson.centerYAnchor),
            
            titleTextFild.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleTextFild.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextFild.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            titleTextFild.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            titleTextFild.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionTextView.topAnchor.constraint(equalTo: titleTextFild.bottomAnchor, constant: 25),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            descriptionTextView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            descriptionTextView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func openGallary(){
        imageАctivityIndicator.isHidden = true
        imageАctivityIndicator.startAnimating()
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = false
            picker.sourceType = .photoLibrary
            present(picker, animated: true, completion: nil)
        }
    }
    
    @objc private func addAttribute() {
        guard let title = titleTextFild.text,
            let description = descriptionTextView.text,
            let image = imagePerson.image,
            !title.isEmpty,
            !description.isEmpty,
            !(imagePerson.image == UIImage(named: "image")) else { return showAlertOnAllCase() }
        presenter?.didTadAddPerson(title: title, description: description, image: image)
    }
    
    @objc private func dismissKayboard(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    //MARK: - Alert
    
    private func showAlertOnAllCase() {
        let alert = UIAlertController(title: nil, message: "Заполните все поля", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}

//MARK: - MenuToAddPersonInput
extension MenuToAddPersonView: MenuToAddPersonInput {
    
}

//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension MenuToAddPersonView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let choosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imagePerson.image = choosenImage
        }
        imageАctivityIndicator.isHidden = false
        imageАctivityIndicator.stopAnimating()
        dismiss(animated: true, completion: nil)
        print("image selected from gallery")
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imageАctivityIndicator.isHidden = false
        imageАctivityIndicator.stopAnimating()
        dismiss(animated: true, completion: nil)
    }
}

extension MenuToAddPersonView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

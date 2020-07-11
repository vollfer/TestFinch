//
//  MenuToAddPersonPresenter.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 08.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol MenuToAddPersonInput: class {
    
}

final class MenuToAddPersonPresenter {
    
    // MARK: - Properties
    
    weak var view: MenuToAddPersonInput?
    var router: MenuToAddPersonRouter?
    private var personsDataSingleton = PersonsDataSingleton.shared
    
}

//MARK: - MenuToAddPersonViewOutput
extension MenuToAddPersonPresenter: MenuToAddPersonViewOutput {
    func didTadAddPerson(name: String, attribute: String, image: UIImage) {
        personsDataSingleton.persons.append(Person(title: name, description: attribute, imagePerson: image))
        print(personsDataSingleton.persons)
        router?.returnMenu()
    }
}


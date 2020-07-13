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
    private var coreData = CoreDataManager.shared
    
}

//MARK: - MenuToAddPersonViewOutput
extension MenuToAddPersonPresenter: MenuToAddPersonViewOutput {
    func didTadAddPerson(title: String, description: String, image: UIImage) {
        coreData.createEmployee(title: title, description: description, image: image)
        router?.returnMenu()
    }
}


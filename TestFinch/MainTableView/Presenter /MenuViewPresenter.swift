//
//  MenuViewPresenter.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 08.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

protocol MenuViewInput: class {
    
}

final class MenuViewPresenter {
    
    // MARK: - Properties
    
    weak var view: MenuViewInput?
    var router: MenuViewRouterInput?
    
}

//MARK: - MainTableViewControllerOutput
extension MenuViewPresenter: MenuViewControllerOutput {
    func tapAddButton() {
        router?.openMenuToAdd()
    }
}

//MARK: - MenuTableViewManagerDelegate
extension MenuViewPresenter: MenuTableViewManagerDelegate {
    func didSelect(person: Persons) {
        router?.openAboutCellMenu(person: person)
    }
    
    
}

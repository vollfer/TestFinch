//
//  MenuViewRouter.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 08.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol MenuViewRouterInput: class {
    func openMenuToAdd()
    func openAboutCellMenu(person: Person)
}

final class MenuViewRouter {
    
    //MARK: - Properties
    
    unowned private let view: UIViewController
    
    //MARK: - Init
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension MenuViewRouter: MenuViewRouterInput {
    func openAboutCellMenu(person: Person) {
        let model = AboutCellAssemble.Model(person: person)
        let module = AboutCellAssemble.assembleModule(with: model)
        view.navigationController?.pushViewController(module, animated: true)
    }
    
    func openMenuToAdd() {
        let viewNext = MenuToAddPersonAssemble.assembleModule()
        view.navigationController?.pushViewController(viewNext, animated: true)
    }
}

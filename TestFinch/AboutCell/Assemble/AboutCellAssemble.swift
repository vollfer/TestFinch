//
//  AboutCellAssemble.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 09.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

final class AboutCellAssemble {
    
    struct Model {
        let person: Persons
    }
    
    static func assembleModule(with model: Model) -> UIViewController {
        
        let module = AboutCellView()
        let presenter = AboutCellPresenter(person: model.person)
        let router = AboutCellRouter(view: module)
        
        module.presenter = presenter
        
        presenter.view = module
        presenter.router = router
        
        return module
    }
}

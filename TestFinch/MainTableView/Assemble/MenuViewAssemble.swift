//
//  MenuViewAssemble.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 08.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

class MenuViewAssemble {
    
    static func assembleModuleNavigation() -> UINavigationController{
        
        let module = MenuViewController()
        let presenter = MenuViewPresenter()
        let router = MenuViewRouter(view: module)
        let tableViewManager = MenuTableViewManager()
        
        module.presenter = presenter
        module.tableViewManager = tableViewManager
        
        tableViewManager.delegate = presenter
        
        presenter.view = module
        presenter.router = router
        
        let navigationController = UINavigationController(rootViewController: module)
        navigationController.setNavigationBarHidden(true, animated: false)
        
        return navigationController
    }
}

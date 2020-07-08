//
//  MainTableViewAssemble.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 08.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

class MainTableViewAssemble {
    
    static func assembleModuleNavigation() -> UINavigationController{
        
        let module = MainTableViewController()
        let presenter = MainTableViewPresenter()
        let router = MainTableViewRouter()
        
        module.presenter = presenter
        
        presenter.view = module
        presenter.router = router
        
        let navigationController = UINavigationController(rootViewController: module)
        navigationController.setNavigationBarHidden(true, animated: false)
        
        return navigationController
    }
}

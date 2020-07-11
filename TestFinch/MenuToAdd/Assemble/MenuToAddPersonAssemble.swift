//
//  MenuToAddPersonAssemble.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 08.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

final class MenuToAddPersonAssemble {
    
    static func assembleModule() -> UIViewController {
        
        let module = MenuToAddPersonView()
        let presenter = MenuToAddPersonPresenter()
        let router = MenuToAddPersonRouter(view: module)
        
        module.presenter = presenter
        
        presenter.view = module
        presenter.router = router
        
        return module
    }
}

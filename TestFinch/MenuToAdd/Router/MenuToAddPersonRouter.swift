//
//  MenuToAddPersonRouter.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 08.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol MenuToAddPersonRouterInput {
    func returnMenu()
}

final class MenuToAddPersonRouter {
    
    //MARK: - Properties
    
    unowned private let view: UIViewController
    
    //MARK: - Init
    
    init(view: UIViewController) {
        self.view = view
    }
}

//MARK: - MenuToAddPersonRouterInput
extension MenuToAddPersonRouter: MenuToAddPersonRouterInput {
    func returnMenu() {
        view.navigationController?.popViewController(animated: true)
    }
}

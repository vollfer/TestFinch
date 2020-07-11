//
//  AboutCellRouter.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 09.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol AboutCellRouterInput {
    
}

final class AboutCellRouter {
    
    //MARK: - Properties
    
    unowned private let view: UIViewController
    
    //MARK: - Init
    
    init(view: UIViewController) {
        self.view = view
    }
}

//MARK: - AboutCellRouterInput
extension AboutCellRouter: AboutCellRouterInput {
    
}

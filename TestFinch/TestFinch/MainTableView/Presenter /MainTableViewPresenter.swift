//
//  MainTableViewPresenter.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 08.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

protocol MainTableViewPresenterInput: class {
    
}

final class MainTableViewPresenter {
    
    weak var view: MainTableViewPresenterInput?
    var router: MainTableViewRouterInput?
    
    
}

//MARK: - MainTableViewControllerOutput
extension MainTableViewPresenter: MainTableViewControllerOutput {
    
}

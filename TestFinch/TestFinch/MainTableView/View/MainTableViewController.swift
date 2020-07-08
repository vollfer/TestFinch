//
//  MainTableViewController.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 08.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol MainTableViewControllerOutput {
    
}

final class MainTableViewController: UIViewController {
    
    //MARK: - Properties
    var presenter: MainTableViewControllerOutput?
    
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        drawSelf()
    }
    
    private func drawSelf() {
        
    }
}

//MARK: - MainTableViewPresenter
extension MainTableViewController: MainTableViewPresenterInput {
    
}

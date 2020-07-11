//
//  MenuViewController.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 08.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol MenuViewControllerOutput {
    func tapAddButton()
}

final class MenuViewController: UIViewController {
    
    //MARK: - Properties
    
    var presenter: MenuViewControllerOutput?
    var tableViewManager: MenuTableViewInput?
    
    private let addPersonButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "plus"), for: .normal)
        
        return button
    }()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        drawSelf()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableViewManager?.reloadData()
    }
    
    private func drawSelf() {
        
        title = "Главный экран"
        
        view.systemBackground()
        let tableView = UITableView()
        tableView.systemBackground()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
        // navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addPersonButton)
        //  addPersonButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        tableViewManager?.setup(tableView: tableView)
    }
    
    // MARK: - Actions
    
    @objc func didTapAddButton() {
        presenter?.tapAddButton()
    }
}

//MARK: - MainTableViewPresenter
extension MenuViewController: MenuViewInput {
    
}

//
//  MainTableViewManager.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 08.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

protocol MenuTableViewManagerDelegate: class {
    func didSelect(person: Person)
}

protocol MenuTableViewInput {
    func setup(tableView: UITableView)
    func reloadData()
}

final class MenuTableViewManager: NSObject {
    
    weak var tableView: UITableView?
    weak var delegate: MenuTableViewManagerDelegate?
    private let indef = "Mycell"
}

// MARK: - MenuTableViewInput
extension MenuTableViewManager: MenuTableViewInput {
    
    func setup(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: indef)
        
        self.tableView = tableView
    }
    
    func reloadData() {
        tableView?.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension MenuTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonsDataSingleton.shared.persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: indef, for: indexPath)
        guard let personCell = cell as? MenuTableViewCell else { return cell }
        let persons = PersonsDataSingleton.shared.persons[indexPath.row]
        personCell.setup(title: persons.title, description: persons.description, image: persons.imagePerson)
        
        return personCell
    }
}

// MARK: - UITableViewDelegate
extension MenuTableViewManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let person = PersonsDataSingleton.shared.persons[indexPath.row]
        delegate?.didSelect(person: person)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        PersonsDataSingleton.shared.persons.remove(at: indexPath.row)
        
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}



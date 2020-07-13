//
//  AboutCellPresenter.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 09.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

protocol AboutCellInput: class {
    func updateViewIfNeeded(with person: Persons?)
}

final class AboutCellPresenter {
    
    // MARK: - Properties
    
    weak var view: AboutCellInput?
    var router: AboutCellRouter?
    private let person: Persons?
    
    // MARK: - Init
    
    init(person: Persons? = nil) {
        self.person = person
    }
}

//MARK: - AboutCellOutput
extension AboutCellPresenter: AboutCellViewOutput {
    func viewIsReady() {
        view?.updateViewIfNeeded(with: person)
    }
}


//
//  Person.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 09.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

struct Person {
    let title: String
    let description: String
    let imagePerson: UIImage
    
}

final class PersonsDataSingleton {
    
    static let shared = PersonsDataSingleton()
    
    var persons: [Person] = []
    
    private init() {
        
    }
}

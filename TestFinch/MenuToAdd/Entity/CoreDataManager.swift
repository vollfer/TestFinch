//
//  CoreDataManager.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 12.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import CoreData
import UIKit

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    var personss: [Persons] = []
    
    func createEmployee(title: String, description: String, image: UIImage) {
        let appDelegete = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegete.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Persons", in: context)
        let persons = NSManagedObject(entity: entity!, insertInto: context) as! Persons
        
        persons.title = title
        persons.descriptionTitle = description
        let data = image.pngData() as Data?
        persons.image = data
        do {
            try context.save()
            personss.append(persons)
            print(personss)
            print("good")
        } catch let createError {
            print("Failed to create: \(createError)")
        }
    }
    
    func fetchEmployee() {
        let appDelegete = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegete.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Persons> = Persons.fetchRequest()
        
        do {
            personss = try context.fetch(fetchRequest)
        } catch let fetchError {
            print("Failed to fetch: \(fetchError)")
        }
    }
    
    func deleteEmployee(persons: Persons) {
        let appDelegete = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegete.persistentContainer.viewContext
        context.delete(persons)
        do {
            try context.save()
        } catch let saveError {
            print("Failed to delete: \(saveError)")
        }
    }
}

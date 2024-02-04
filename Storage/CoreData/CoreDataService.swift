//
//  CoreDataService.swift
//  Storage
//
//  Created by Elizaveta Shidlovskaya on 4.02.24.
//

import Foundation
import CoreData


final class CoreDataService {
    
    static var shared: CoreDataService = .init()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NotificationDataBase")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext (completion: ((Bool) -> Void)? = nil) {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                completion?(true)
            } catch {
                let nserror = error as NSError
                completion?(false)
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}


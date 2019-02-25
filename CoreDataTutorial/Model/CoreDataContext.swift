//
//  ContextSingleton.swift
//  CoreDataTutorial
//
//  Created by Mai Hassan on 2/5/19.
//  Copyright © 2019 Mai Hassan. All rights reserved.
//

import UIKit
import CoreData

class CoreDataContext {
    
    static let sharedContext = CoreDataContext()
    
    private init () {}
    
    func getContext() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        return managedContext
    }
    
    
}

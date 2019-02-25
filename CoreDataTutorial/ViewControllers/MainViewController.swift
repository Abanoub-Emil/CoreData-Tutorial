//
//  ViewController.swift
//  CoreDataTutorial
//
//  Created by Mai Hassan on 2/5/19.
//  Copyright © 2019 Mai Hassan. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {

    var allNotes: [Note] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
       save(name: "Core data tutorial")
    }

    func save(name: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // 2
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: managedContext)!
        
        let note = NSManagedObject(entity: entity, insertInto: managedContext)
        
        // 3
        note.setValue(name, forKeyPath: "value")
        
        // 4
        do {
            try managedContext.save()
            allNotes.append(note as! Note)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

}


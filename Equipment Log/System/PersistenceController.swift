//
//  PersistenceController.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 6/28/24.
//

import Foundation
import CoreData

struct PersistenceController {
    // MARK: Handles all the business logic, management if Credata
    
      let container: NSPersistentContainer
      
      static let shared = PersistenceController()
      
      // Convenience
      var viewContext: NSManagedObjectContext {
          return container.viewContext
      }
      
      static var preview: PersistenceController = {
          let result = PersistenceController(inMemory: true)
          let viewContext = result.container.viewContext
          
         // Projects
          let newProjects = ProjectEntity(context: viewContext)
          newProjects.projectName = "Amazon"
          
          shared.saveEntities()
          
          return result
      }()
      
    // MARK: Must be the same name of CoreDataModel name created for NSPersistentContainer !
    
      init(inMemory: Bool = false) {
          container = NSPersistentContainer(name: "CoreDataModel") // else UnsafeRawBufferPointer with negative count
          if inMemory {
              container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
          }
          container.loadPersistentStores(completionHandler: { (storeDescription, error) in
              if let error = error as NSError? {
                  fatalError("Unresolved error \(error), \(error.userInfo)")
              }
          })
      }
      // Better save
      func saveEntities() {
          let context = container.viewContext
          
          if context.hasChanges {
              do {
                  try context.save()
              } catch {
                  fatalError("Error: \(error.localizedDescription)")
              }
          }
      }
  }




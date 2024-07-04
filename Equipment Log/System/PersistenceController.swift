//
//  PersistenceController.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 6/28/24.
//

import Foundation
import CoreData

struct PersistenceController {
    
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
        //  let newCompany = Department(context: viewContext)
      //    newCompany.name = "Apple"
          
          shared.saveEntities()
          
          return result
      }()
      
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




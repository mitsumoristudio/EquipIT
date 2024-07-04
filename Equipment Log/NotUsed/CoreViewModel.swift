//
//  CoreViewModel.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 8/17/24.
//

import Foundation
import CoreData



//class CoreViewModel: ObservableObject {
//    @Published var searchText: String = ""
//    @Published var equipments: [EquipmentEntity] = []
//    
//    private var context: NSManagedObjectContext
//    private var fetchRequest: NSFetchRequest<EquipmentEntity>
//    
//    init(context: NSManagedObjectContext) {
//        self.context = context
//        self.fetchRequest = EquipmentEntity.fetchRequest()
//    }
//    
//    func fetechItems() {
//        let predicate: NSPredicate?
//        if searchText.isEmpty {
//            predicate = nil
//        } else {
//            predicate = NSPredicate(format: "name CONTAINS[cd] %@", searchText)
//        }
//        fetchRequest.predicate = predicate
//        
//        do {
//            equipments = try context.fetch(fetchRequest)
//        } catch {
//            print("Failed to fetch items ")
//            
//        }
//    }
//}

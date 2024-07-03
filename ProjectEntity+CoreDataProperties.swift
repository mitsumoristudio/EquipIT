//
//  ProjectEntity+CoreDataProperties.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 6/28/24.
//
//

import Foundation
import CoreData


extension ProjectEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProjectEntity> {
        return NSFetchRequest<ProjectEntity>(entityName: "ProjectEntity")
    }

    @NSManaged public var superintendent: String?
    @NSManaged public var projectNumber: String?
    @NSManaged public var projectName: String?
    @NSManaged public var projectManager: String?
    @NSManaged public var projectDate: String?
    @NSManaged public var profileImage: Data?
    @NSManaged public var location: String?
    @NSManaged public var jobsiteDescription: String?
    @NSManaged public var id: UUID?
    @NSManaged public var client: String?
    @NSManaged public var projecttoEquipment: Set<EquipmentEntity>?
    
    public var equipments: [EquipmentEntity] {
        let setofEmployee = projecttoEquipment
        return setofEmployee!.sorted {
            $0.id > $1.id
        }
    }

}

// MARK: Generated accessors for projecttoEquipment
extension ProjectEntity {

    @objc(addProjecttoEquipmentObject:)
    @NSManaged public func addToProjecttoEquipment(_ value: EquipmentEntity)

    @objc(removeProjecttoEquipmentObject:)
    @NSManaged public func removeFromProjecttoEquipment(_ value: EquipmentEntity)

    @objc(addProjecttoEquipment:)
    @NSManaged public func addToProjecttoEquipment(_ values: NSSet)

    @objc(removeProjecttoEquipment:)
    @NSManaged public func removeFromProjecttoEquipment(_ values: NSSet)

}

extension ProjectEntity : Identifiable {

}

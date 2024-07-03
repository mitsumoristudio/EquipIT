//
//  HeavyEquipListView.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 7/3/24.
//

import Foundation
import SwiftUI

struct HeavyEquipListView: View {
    @Environment(\.managedObjectContext) var viewContext
    var backgroundGradientlight =  Color(#colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 0.7262779387))
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ProjectEntity.projectName, ascending: true)]) private var projectsSelected: FetchedResults<ProjectEntity>
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \EquipmentEntity.equipmentName, ascending: true)]) private var equipments: FetchedResults<EquipmentEntity>
    
    func deleteProjectEntity(at offset: IndexSet) {
        for index in offset {
            let projectDelete = projectsSelected[index]
            
            do {
                viewContext.delete(projectDelete)
                try viewContext.save()
                
            } catch let error {
                print("Error found while deleting project \(error.localizedDescription)")
            }
        }
    }
    
    func deleteEquipmentEntity(at offset: IndexSet) {
        for index in offset {
            let equipmentDelete = equipments[index]
            
            do {
                viewContext.delete(equipmentDelete)
                try viewContext.save()
                
            } catch let error {
                print("Error found while deleing \(error.localizedDescription)")
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack() {
                VStack(alignment: .leading, spacing: 7) {
                    List {
                        ForEach(projectsSelected, id: \.self) { items in
                            //  ForEach(coreDataVM.savedEntities.sorted(by: { $0.projectDate ?? "" > $1.projectDate ?? "" }), id: \.self) { items in
                            ForEach(items.equipments, id: \.self) { equipments in
                                NavigationLink {
                                    EquipmentCell(projectName: items.projectName ?? "", projectLocation: items.location ?? "", projectClient: items.client ?? "", equipments: equipments)
                                    //                                ProjectDetailCard(projectName: items.projectName ?? "", projectNumber: items.projectNumber ?? "", projectLocation: items.location ?? "", projectManager: items.projectManager ?? "", superintendent: items.superintendent ?? "", client: items.client ?? "", projectdetails: items.jobsiteDescription ?? "", projectImage: items.profileImage)
                                } label: {
                                    VStack() {
                                        JobsiteCell(projectName: items.projectName ?? "", jobsiteName: equipments.equipmentName ?? "", jobsiteDate: equipments.inspectionDate ?? "", projectImage: items.profileImage!)
                                        //                                    ProjectCell(projectName: items.projectName ?? "", projectNumber: items.projectNumber ?? "", projectDate: items.projectDate ?? "", projectLocation: items.location ?? "", categoryColor: "", projectImage: items.profileImage)
                                    }
                                }
                            }
                        }
                        .onDelete(perform: { indexSet in
                            deleteEquipmentEntity(at: indexSet)
                        })
                    }
                }
                .background(backgroundGradientlight)
            }
            .navigationTitle("Equipment PreProduction")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading, content: {
                NavigationLink(destination: {
                    InspectionView()
                }, label: {
                    Image(systemName: "document.circle")
                        .foregroundColor(Color.blue)
                        .background(Color.black, in: Circle())
                        .font(.title2)
                })
            })
        }
    }
}

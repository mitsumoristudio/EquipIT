//
//  EquipmentListView.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 7/1/24.
//

import Foundation
import SwiftUI

struct EquipmentListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ProjectEntity.projectName, ascending: true)]) private var projects: FetchedResults<ProjectEntity>
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \EquipmentEntity.equipmentName, ascending: true)]) private var equipments: FetchedResults<EquipmentEntity>
    
    func deleteProjectEntity(at offset: IndexSet) {
        for index in offset {
            let projectDelete = projects[index]
            
            do {
                viewContext.delete(projectDelete)
            } catch let error {
                print("Error found while deleting \(error.localizedDescription)")
            }
        }
    }
    
    func deleteEquipment(at offset: IndexSet) {
        for index in offset {
            let equipmentDelete = equipments[index]
            
            do {
                viewContext.delete(equipmentDelete)
            } catch let error {
                print("Error found while deleting \(error.localizedDescription)")
            }
        }
    }
    
    var body: some View {
        //  ScrollView {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    //       LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 10)], spacing: 5) {
                    ForEach(projects, id: \.self) { items in
                        ForEach(items.equipments, id: \.self) {equipment in
                            NavigationLink(destination: {
                                EquipmentCell(projectName: items.projectName ?? "", projectLocation: items.location ?? "", projectClient: items.client ?? "", equipments: equipment)
                            }, label: {
                                VStack(alignment: .leading, spacing: 10) {
                                    JobsiteCell(projectName: items.projectName ?? "", jobsiteName: equipment.equipmentName ?? "", jobsiteDate: equipment.inspectionDate ?? "", projectImage: items.profileImage!)
                                    
                                    //                                        JobSiteCard(projectName: items.projectName ?? "", projectImage: items.profileImage, jobsiteName: equipment.equipmentName ?? "", jobsiteDate: equipment.inspectionDate ?? "")
                                }
                            })
                        }
                        .onDelete(perform: { indexSet in
                            deleteEquipment(at: indexSet)
                        })
                        
                    }
                    .onDelete(perform: { indexSet in
                        deleteProjectEntity(at: indexSet)
                    })
                    
                    
                    .padding()
                    .navigationTitle("Project Inspection Report")
                    .navigationBarTitleDisplayMode(.inline)
                    //       .navigationBarBackButtonHidden(true)
                    //   }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing, content: {
                            NavigationLink(destination: {
                                InspectionView()
                            }, label: {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(Color.white)
                                    .background(Color.black, in: Circle())
                                    .font(.title2)
                            })
                        })
                        //                    .toolbar {
                        //                        ToolbarItem(placement: .navigationBarLeading, content: {
                        //                            NavigationLink(destination: {
                        //                                dismiss()
                        //                            }, label: {
                        //                                Image(systemName: "chevron.backward.circle")
                        //                                    .foregroundColor(Color.white)
                        //                                    .background(Color.black, in: Circle())
                        //                                    .font(.title2)
                        //                            })
                        //                        })
                    }
                }
            }
        }
    }
}


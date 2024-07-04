//
//  ProjectListView.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 6/28/24.
//

import Foundation
import SwiftUI

struct ProjectListView : View {
    @Environment(\.managedObjectContext) var viewContext
    
    var backgroundGradientlight =  Color(#colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 0.7262779387))
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ProjectEntity.projectName, ascending: true)]) private var projects: FetchedResults<ProjectEntity>
    
    func deleteProjectEntity(at offset: IndexSet) {
        for index in offset {
            let projectDelete = projects[index]
            
            do {
                viewContext.delete(projectDelete)
                try viewContext.save()
                // Add the viewContext.save to store the data after saved
            } catch let error {
                print("Error found while deleting \(error.localizedDescription)")
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack() {
                
                VStack(alignment: .leading, spacing: 5) {
                    List {
                        ForEach(projects, id: \.self) { items in
                            //  ForEach(coreDataVM.savedEntities.sorted(by: { $0.projectDate ?? "" > $1.projectDate ?? "" }), id: \.self) { items in
                            
                            NavigationLink {
                                ProjectDetailCard(projectName: items.projectName ?? "", projectNumber: items.projectNumber ?? "", projectLocation: items.location ?? "", projectManager: items.projectManager ?? "", superintendent: items.superintendent ?? "", client: items.client ?? "", projectdetails: items.jobsiteDescription ?? "", projectImage: items.profileImage)
                            } label: {
                                VStack() {
                                    ProjectCell(projectName: items.projectName ?? "", projectNumber: items.projectNumber ?? "", projectDate: items.projectDate ?? "", projectLocation: items.location ?? "", categoryColor: "", projectImage: items.profileImage)
                                }
                            }
                        }
                        .onDelete(perform: { indexSet in
                            deleteProjectEntity(at: indexSet)
                        })
                    }
                    // MARK: Add on Appear to fetch job info
                    .onAppear {
                        //         coreDataVM.fetchEquipmentEntities()
                    }
                }
                .navigationTitle("Ongoing Projects")
                .navigationBarTitleDisplayMode(.inline)
                
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
                    
                }
                .background(backgroundGradientlight)
            }
        }
    }
}

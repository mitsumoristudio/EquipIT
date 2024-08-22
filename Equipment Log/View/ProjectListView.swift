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
    // used to get the context and update or create entities
    
    var backgroundGradientlight =  Color(#colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 0.7262779387))
    
    @State private var searchText: String = ""
    // defines the searchText for Search bar
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ProjectEntity.projectName, ascending: true)]) private var projects: FetchedResults<ProjectEntity>
    // used to fetch data from CoreData and display in the project list.
    
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
    // MARK: Function use to delete entities from CoreData.
    
    // MARK: Filters array of ProjectEntity based on ascending ProjectName
    var filteredProjects: [ProjectEntity] {
        guard !searchText.isEmpty else {
            return projects.sorted { $0.projectName ?? "" < $1.projectName ?? ""}
        }
        return projects.filter { search in
            search.projectName?.localizedCaseInsensitiveContains(searchText) ?? false
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack() {
                
                VStack(alignment: .leading, spacing: 5) {
                    List {
                        ForEach(filteredProjects, id: \.self) { items in
                             
                            // MARK: Without using the search bar. Will filter the project based on project date created
                     //   ForEach(projects.sorted(by: { $0.projectDate ?? "" < $1.projectDate  ?? ""}), id: \.self) { items in
                          
                            
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
                            // MARK: action to delete ProjectEntity based on given indexSet
                        })
                    }
                }
                // MARK: Search Bar Button filtering by Project Name
                
                .searchable(text: $searchText, prompt: "Search Project")
            
                .onChange(of: searchText, { (searchText, _) in
                        
                })
                
                .navigationTitle("Ongoing Projects")
                .navigationBarTitleDisplayMode(.inline)
                
                // MARK: Toolbar to navigate to add new Project
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        NavigationLink(destination: {
                            ProjectAddView(needtoRefresh: .constant(true))
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(Color.white)
                                .background(Color.black, in: Circle())
                                .font(.title2)
                        })
                    })
                    
                }
                .background(backgroundGradientlight)
                // sets the overallbackground in ZStack
            }
        }
    }
}

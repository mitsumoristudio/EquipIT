//
//  ProjectDetailCard.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 6/28/24.
//

import Foundation
import SwiftUI

struct ProjectDetailCard: View {
    @State  var projectName: String
    @State  var projectNumber: String
    @State  var projectLocation: String
    @State  var projectManager: String
    @State  var superintendent: String
    @State  var client: String
    @State  var projectdetails: String
    
    @Environment(\.dismiss) var dismiss
    @State var projectImage: Data?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    
                    if projectImage != nil {
                        Image(uiImage: UIImage(data: projectImage!)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: 330, maxHeight: 330)
                            .shadow(radius: 5)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    } else {
                        Image("DailyReportLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: 330, maxHeight: 330)
                            .shadow(radius: 5)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                       
                    // MARK: Add projectHeadlines View here
                    projectHeadlines()
                }
                .padding()
            }
            .ignoresSafeArea(.all, edges: .top)
            .navigationBarBackButtonHidden(true)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading, content: {
                Button(action: {
                    dismiss()
                    
                }, label: {
                    Image(systemName: "chevron.backward.circle")
                        .foregroundColor(Color.white)
                        .background(Color.black, in: Circle())
                        .font(.title)
                })
            })
        }
    }
}

extension ProjectDetailCard {
    // MARK: Extension for ProjectUI details
    
    func projectHeadlines() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(projectName)
                .font(.system(.title2, design: .rounded))
                .fontWeight(.black)
            
            Text("Project Number: \(projectNumber)")
                .font(.headline)
                .fontWeight(.black)
            
            Text("Location: \(projectLocation)")
                .font(.subheadline)
                .fontWeight(.black)
                .padding(.bottom, 10)
            
            Text("Project Manager: \(projectManager)")
                .font(.subheadline)
                .fontWeight(.medium)
            
            Text("Superintedent: \(superintendent)")
                .font(.subheadline)
                .fontWeight(.medium)
            
            Text("Client: \(client)")
                .font(.subheadline)
                .fontWeight(.medium)
            
            Text("Project Details")
                .font(.subheadline)
                .fontWeight(.heavy)
            
            Text("\(projectdetails)")
                .font(.subheadline)
                .fontWeight(.medium)
        }
    }
}



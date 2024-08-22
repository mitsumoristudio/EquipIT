//
//  ProjectCell.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 6/28/24.
//

import Foundation
import SwiftUI

struct ProjectCell: View {
    
    @State var projectName: String
    @State var projectNumber: String
    @State var projectDate: String
    @State var projectLocation: String
    @State var categoryColor: String
    @State var projectImage: Data?
    
    private func getScreenRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            HStack(alignment: .center, spacing: 36) {
                Text("Job ID #: \(projectNumber)")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.black).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .background {
                        Capsule()
                            .fill(.secondary.opacity(0.1))
                            .frame(minWidth: 180, minHeight: 36)
                        
                    }
                    .padding(.horizontal, 10)
                
                if projectImage != nil {
                    Image(uiImage: UIImage(data: projectImage!)!)
                    // ProjectImage is stored as Binary data. Must pass in data UI Image to upload
                    
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 46, height: 46)
                } else {
                    // if the image is nil, return App logo
                    Image("DailyReportLogo")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 46, height: 46)
                }
            }
            .padding(.vertical, 2)
            
            Text(projectName)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.vertical, 12)
                .lineLimit(3)
            
            HStack(alignment: .bottom, spacing: 0) {
                VStack(alignment: .leading, spacing: 10) {
                    Label {
                        Text(projectDate)
                    } icon: {
                        Image(systemName: "calendar")
                    }
                    .font(.headline)
                    .foregroundColor(.black).opacity(0.8)
                    .fontWeight(.light)
                    
                    Label {
                        Text(projectLocation)
                    } icon: {
                        Image(systemName: "map.circle")
                    }
                    .font(.headline)
                    .foregroundColor(.black).opacity(0.8)
                    .fontWeight(.light)
                }
            }
        }
        
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding([.leading, .horizontal, .bottom])
        
        .background {
            RoundedRectangle(cornerRadius: 12,style: .continuous)
                .fill(Color(.systemGray6))
                .shadow(radius: 12, x: 5, y: 5)
            
        }
        // MARK: Sets the background for Card
    }
}

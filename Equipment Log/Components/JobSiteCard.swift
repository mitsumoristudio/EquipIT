//
//  JobSiteCard.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 7/2/24.
//

import Foundation
import SwiftUI

struct JobSiteCard: View {
    @State var projectName: String
    @State var projectImage: Data?
    @State var jobsiteName: String
    @State var jobsiteDate: String
    
    var body: some View {
        VStack(spacing: 5) {
            if projectImage != nil {
                Image(uiImage: UIImage(data: projectImage!)!)
                    .resizable().aspectRatio(contentMode: .fill)
                    .overlay(alignment: .bottom) {
                        VStack() {
                            Text(projectName)
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .shadow(color: .black, radius: 10, x: 0, y: 10)
                                .frame(maxWidth: 140)
                                .padding()
                            
                            Text(jobsiteName)
                                .font(.subheadline)
                                .foregroundColor(Color.white)
                                .shadow(color: .black, radius: 10, x: 0, y: 10)
                                .frame(maxWidth: 140)
                            
                            Text("Date: \(jobsiteDate)")
                                .font(.subheadline)
                                .foregroundColor(Color.white)
                                .shadow(color: .black, radius: 10, x: 0, y: 10)
                                .frame(maxWidth: 140)
                            
                        }
                    }
                    .frame(width: 160, height: 220, alignment: .top)
             //       .frame(minWidth: 140, minHeight: 220, alignment: .top)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.5), Color(.gray)]), startPoint: .top, endPoint: .bottom))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 0)
                
            } else {
                Image("DailyReportLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaledToFit()
                    .frame(width: 160, height: 220, alignment: .top)
                  //  .frame(minWidth: 140, minHeight: 220, alignment: .top)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 0)
            }
        }
    }
}

struct JobsiteCell: View {
    
    @State var projectName: String
    @State var jobsiteName: String
    @State var jobsiteDate: String
    @State var projectImage: Data?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            HStack(alignment: .center, spacing: 36) {
                Text(projectName)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.black).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .background {
                        Capsule()
                            .fill(.white.opacity(0.40))
                            .frame(minWidth: .infinity, minHeight: 36)
                        
                    }
                    .padding(.horizontal, 10)
                
                if projectImage != nil {
                    Image(uiImage: UIImage(data: projectImage!)!)
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 46, height: 46)
                } else {
                    Image("DailyReportLogo")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 46, height: 46)
                }
            }
            .padding(.vertical, 2)
            
            Text(jobsiteName)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.vertical, 12)
                .lineLimit(3)
            
            HStack(alignment: .bottom, spacing: 0) {
                VStack(alignment: .leading, spacing: 10) {
                    Label {
                        Text(jobsiteDate)
                    } icon: {
                        Image(systemName: "calendar")
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
    }
    }


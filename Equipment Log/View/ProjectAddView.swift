//
//  ProjectAddView.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 6/28/24.
//

import Foundation
import SwiftUI

struct ProjectAddView: View {
    
    var backgroundGradientlight =  Color(#colorLiteral(red: 0.3628445035, green: 0.8369211084, blue: 0.7693976097, alpha: 0.7386692881))
    @State var category: String = ""
    @State var jobsitedescription: String = ""
    @State var dateSelect: Date = .init()
    @State var projectName: String = ""
    @State var projectNumber: String = ""
    @State var projectManager: String = ""
   
    @State var superintendent: String = ""
    @State var client: String = ""
    @State var projectLocation: String = ""
    @Environment(\.dismiss) var dismiss
    @Binding var needtoRefresh: Bool
    @State var showImagePicker = false
    
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var selectedImage: UIImage?
    
    private func getScreenReact() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func titleView(_ value: String, _ color: Color = .white.opacity(0.9)) -> some View {
        Text(value)
            .font(.system(size: 16, design: .rounded))
            .foregroundStyle(color)
            .fontWeight(.semibold)
    }
    
    var body: some View {
        NavigationStack {
            ZStack() {
                backgroundGradientlight
                    .ignoresSafeArea()
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 10) {
                        
                        titleView("Project")
                        
                        TextField("Enter Project Name", text: $projectName)
                            .font(.headline)
                            .padding(.top, 2)
                            .foregroundColor(Color.white)
                            .modifier(TextFieldClearButton(nextText: $projectName))
                        
                        Rectangle()
                            .fill(.white.opacity(0.8))
                            .frame(height: 1)
                        
                        titleView("Project Number")
                        
                        TextField("Enter Project Number", text: $projectNumber)
                            .font(.headline)
                            .padding(.top, 2)
                            .foregroundColor(Color.white)
                            .modifier(TextFieldClearButton(nextText: $projectNumber))
                        
                        Rectangle()
                            .fill(.white.opacity(0.8))
                            .frame(height: 1)
                        
                        titleView("Date") // MARK: Project Date Created
                        
                        HStack(spacing: 12) {
                            HStack(spacing: 10) {
                                Text(dateSelect.toString("EEEE dd, MMMM"))
                                    .font(.subheadline)
                                
                                Image(systemName: "calendar")
                                    .font(.title)
                                    .foregroundColor(Color.white)
                                    .overlay {
                                        DatePicker("", selection: $dateSelect, displayedComponents: [.date])
                                            .blendMode(.destinationOver)
                                    }
                                
                                showImagePickerPhoto
                                // MARK: Shows the image picker and used to select photos
                            }
                            .offset(y: -5)
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .fill(.white.opacity(0.8))
                                    .frame(height: 1)
                                    .offset(y: 5)
                            }
                        }
                        .padding(.vertical, 10)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Group {
                                titleView("Project Manager")
                                
                                TextField("Enter Project Manager", text: $projectManager)
                                    .font(.headline)
                                    .padding(.top, 2)
                                    .foregroundColor(Color.white)
                                    .modifier(TextFieldClearButton(nextText: $projectManager))
                                
                                Rectangle()
                                    .fill(.white.opacity(0.8))
                                    .frame(height: 1)
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    titleView("Superintendent")
                                    
                                    TextField("Enter Superintendent", text: $superintendent)
                                        .font(.headline)
                                        .padding(.top, 2)
                                        .foregroundColor(Color.white)
                                        .modifier(TextFieldClearButton(nextText: $superintendent))
                                    
                                    Rectangle()
                                        .fill(.white.opacity(0.8))
                                        .frame(height: 1)
                                    
                                    titleView("Location")
                                    
                                    TextField("City, State", text: $projectLocation)
                                        .font(.headline)
                                        .padding(.top, 2)
                                        .foregroundColor(Color.white)
                                        .modifier(TextFieldClearButton(nextText: $projectLocation))
                                    
                                    Rectangle()
                                        .fill(.white.opacity(0.8))
                                        .frame(height: 1)
                                    
                                    titleView("Client")
                                    
                                    TextField("Enter Client", text: $client)
                                        .font(.headline)
                                        .padding(.top, 2)
                                        .foregroundColor(Color.white)
                                        .modifier(TextFieldClearButton(nextText: $client))
                                    
                                    Rectangle()
                                        .fill(.white.opacity(0.8))
                                        .frame(height: 1)
                                }
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    Text("Details of Jobsite")
                                        .font(.headline)
                                        .padding(.top, 2)
                                        .foregroundColor(Color.white).opacity(0.8)
                                    
                                    HStack(spacing: 5) {
                                        TextEditor(text: $jobsitedescription)
                                            .frame(maxWidth: .infinity, maxHeight: 140, alignment: .center)
                                        //      .frame(width: 370, height: 80, alignment: .center)
                                            .cornerRadius(10)
                                            .padding(.vertical, 2)
                                        
                                    }
                                    .offset(x:-6)
                                }
                                .padding(.vertical, 5)
                                
                                VStack(spacing: 0) {
                                    Button(action: {
                                        
                                        saveProjectEntity()
                                        // MARK: add persistentContainer to save file
                                        // MARK: Use DateFormatter to convert Date to a string
                                        // MARK: Add some function here and return empty string
                                        
                                        superintendent = ""
                                        projectNumber = ""
                                        projectName = ""
                                        projectManager = ""
                                        projectLocation = ""
                                        jobsitedescription = ""
                                        client = ""
                                        
                                    }, label: {
                                        Text("Save")
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                            .padding()
                                        
                                            .frame(maxWidth: 1000, maxHeight: 60, alignment: .center)
                                        
                                            .foregroundStyle(.white)
                                        
                                            .background(Color(#colorLiteral(red: 0.08988218558, green: 0.4913719465, blue: 0.5871633619, alpha: 0.7386692881)))
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                            .shadow(radius: 20)
                                        
                                            .offset(x: -10, y:0)
                                    })
                                    
                                    
                                    //    .frame(minWidth: 60, minHeight: 50, alignment: .center)
                                    //    .padding(.horizontal, 140)
                                }
                                .padding()
                                
                                Spacer()
                            }
                        }
                    }
                    // MARK: - frame height assigned with CGFloat
                    .frame(height: getScreenReact().height/1.10, alignment: .leading)
                    .padding([.leading, .vertical])
                    
                    // MARK: use fullscreen to display Image picker
                    .fullScreenCover(isPresented: $showImagePicker, content: {
                        ImagePicker(image: $selectedImage)
                    })
                }
                .scrollDismissesKeyboard(.immediately)
                // dismiss the keyboard as soon as Scrolling starts
            }
          
            
            .navigationBarBackButtonHidden(true)
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
}

struct ProjectAddView_Preview: PreviewProvider {
    static var previews: some View {
        ProjectAddView(needtoRefresh: .constant(true))
       //     .environmentObject(ProjectViewModel())
    }
}

extension ProjectAddView {
    
    @ViewBuilder
    var showImagePickerPhoto : some View {
        VStack(spacing: 0) {
            Button(action: {
                self.showImagePicker = true
            }, label: {
                HStack {
                    GradientIconButton(icon: "camera.fill")
                        .padding(.horizontal, 0)
                    
                    Text("Insert Photos")
                        .foregroundStyle(Color.black)
                        .font(.subheadline)
                        .lineLimit(2)
                  //      .frame(minWidth: 40, minHeight: 40)
                    
                    Image(uiImage: selectedImage ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 10)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                }
            
            })
        }
    }
}

// MARK: Extension function to save entities in CoreData
extension ProjectAddView {
    func saveProjectEntity() {
        let timeNow = DateFormatter()
        timeNow.dateStyle = .full
        timeNow.timeStyle = .none
        let laterTimeNow = timeNow
        let dateOnlyFormat = laterTimeNow.string(from: dateSelect)
        
        let newProjects = ProjectEntity(context: viewContext)
        newProjects.profileImage = selectedImage?.pngData()
        newProjects.projectDate = dateOnlyFormat
        newProjects.client = client
        newProjects.jobsiteDescription = jobsitedescription
        newProjects.location = projectLocation
        newProjects.projectName = projectName
        newProjects.projectNumber = projectNumber
        newProjects.projectManager = projectManager
        newProjects.superintendent = superintendent
        
        do {
            try viewContext.save()
            
            print(projectName)
            print(projectManager)
            
        } catch {
            print("Error found while saving Core Data \(error.localizedDescription)")
        }
     
    }

}


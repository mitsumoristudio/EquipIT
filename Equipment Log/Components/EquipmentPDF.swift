//
//  EquipmentPDF.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 7/3/24.
//

import Foundation
import SwiftUI
import UIKit
import PDFKit

struct EquipmentPDF: View {
    @State var generatedImage: Image?
    @State var generatedPDFURL: URL?
    @State var showShareLink: Bool = false
    @ObservedObject var equipmententity : EquipmentEntity
    @ObservedObject var projectentity : ProjectEntity
    
    @Environment(\.dismiss) var dismiss
    
    // MARK: Create PDF File
    @MainActor
    func renderCardView(viewSize: CGSize) {
        let renderer = ImageRenderer(content: EquipmentCell(projectName: projectentity.projectName ?? "",
        projectLocation: projectentity.location ?? "", projectClient: projectentity.client ?? "", equipments: equipmententity)
            .frame(width: viewSize.width, alignment: .center))
        
        if let image = renderer.uiImage{
            generatedImage = Image(uiImage: image)
        }
        
        let tempURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let renderURL = tempURL.appending(path: "\(UUID().uuidString).pdf")
        
        if let consumer = CGDataConsumer(url: renderURL as CFURL), let context = CGContext(consumer: consumer, mediaBox: nil, nil){
            renderer.render { size, renderer in
                var mediaBox = CGRect(origin: .zero, size: size)
                // MARK: Drawing PDF
                context.beginPage(mediaBox: &mediaBox)
                renderer(context)
                context.endPDFPage()
                context.closePDF()
                // MARK: Updating PDF URL
                generatedPDFURL = renderURL
            }
        }
    }
    
    var body: some View {
        
        GeometryReader { proxy in
            let size = proxy.size
            
            NavigationStack {
                ZStack(alignment: .top) {
                    ViewThatFits {
                        EquipmentCell(projectName: projectentity.projectName ?? "", projectLocation: projectentity.location ?? "", projectClient: projectentity.client ?? "", equipments: equipmententity)
                        
                        ScrollView(.vertical) {
                            EquipmentCell(projectName: projectentity.projectName ?? "", projectLocation: projectentity.location ?? "", projectClient: projectentity.client ?? "", equipments: equipmententity)
                        }
                    }
                }
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    renderCardView(viewSize: size)
                }
            }
            
            .navigationBarBackButtonHidden(true)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName:  "chevron.left.circle.fill")
                            .foregroundColor(Color.black).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 24))
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        showShareLink.toggle()
                    }, label: {
                        Image(systemName: "square.and.arrow.up.circle.fill")
                            .foregroundColor(Color.black).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 24))
                    })
                })
                
            }
        }
        .sheet(isPresented: $showShareLink, content: {
            if let generatedPDFURL {
                ShareSheet(items: [generatedPDFURL])
            }
        })
    }
    
}


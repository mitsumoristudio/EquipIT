//
//  SetupView.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 6/28/24.
//

import Foundation
import SwiftUI

struct SetUpView: View {
    @State private var showingContactAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 5) {
                List {
                    Link(destination: URL(string: "https://mitsumoristudios.com/main#page-11")!, label: {
                        MenuRow(title: "Private Policy", leftIcon: "person.line.dotted.person.fill")
                    
                        Link(destination: URL(string: "https://mitsumoristudios.com/main#page-15")!, label: {
                            MenuRow(title: "Terms & Conditions", leftIcon: "books.vertical.circle")
                            
                        })
                    })
                    Button(action: {
                        showingContactAlert.toggle()
                    }, label: {
                        MenuRow(title: "Contact Information", leftIcon: "house.fill")
                    })
                    
                    NavigationLink(destination: {
                      // MARK: - Add Message View Here
                    }, label: {
                        MenuRow(title: "App Features", leftIcon: "lightbulb.led.fill")
                    })
                }
            }
            .alert("Contact Information", isPresented: $showingContactAlert) {
                
            } message: {
                Text("Please email at satoshi@mitsumoristudios.com")
            }
            .frame(maxWidth: .infinity, maxHeight: 400, alignment: .leading)
            .modifier(darktabViewModifier())

            
        }
        .navigationTitle("Setup")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SetUp_Preview: PreviewProvider {
    static var previews: some View {
        SetUpView()
    }
}

struct darktabViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        
            .padding(5)
            .background(Color("Background 1"))
            .background(VisualEffectBlur(blurStyle: .systemThickMaterialDark)).opacity(0.8)
            .overlay(RoundedRectangle(cornerRadius: 15, style: .continuous)
                .stroke(Color.white, lineWidth: 1).blendMode(.overlay))
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding(.top, 5)
    }
}

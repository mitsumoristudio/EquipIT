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
    @State var showMessage: Bool = false
    
    func titleFormat(title: String) -> some View {
        Text(title)
            .font(.title)
            .fontWeight(.bold)
            .padding()
    }
    
    var body: some View {
        NavigationStack {
            ZStack() {
                VStack(alignment: .leading, spacing: 10) {
                    
                    titleFormat(title: "Details")
                    
                    Link(destination: URL(string: "https://mitsumoristudios.com/main#page-11")!, label: {
                        MenuRow(title: "Private Policy", leftIcon: "person.line.dotted.person.fill")
                    })
                    
                    Link(destination: URL(string: "https://mitsumoristudios.com/main#page-15")!, label: {
                        MenuRow(title: "Terms & Conditions", leftIcon: "books.vertical.circle")
                    })
                    
                    Button(action: {
                        showingContactAlert.toggle()
                    }, label: {
                        MenuRow(title: "Contact Information", leftIcon: "house.fill")
                    })
                    
                    NavigationLink(destination: {
                        // MARK: - Add Message View Here
                        MessageView()
                    }, label: {
                        MenuRow(title: "App Features", leftIcon: "lightbulb.led.fill")
                    })
                }
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal, 30)
            .padding(.vertical, 40)
            .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialLight))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(color: Color.black, radius: 10, x: 5, y: 5)
            .padding()
            
        }
        .alert("Contact Information", isPresented: $showingContactAlert) {
            
        } message: {
            Text("Please email at satoshi@mitsumoristudios.com")
        }
    
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

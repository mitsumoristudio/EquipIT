//
//  MessageView.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 8/21/24.
//

import Foundation
import SwiftUI

struct MessageView: View {
    @State var timerset: Double = 0.0
    @State var showMessage: Bool = true
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @Environment(\.dismiss) var dismiss
    
    func titleFormat(title: String) -> some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            titleFormat(title: "Welcome to EquipIT")
                .padding(.horizontal, 40)
            
            OnboardingViewCell(image: "clock.arrow.circlepath", headline: "Comprehensive Reporting", subheadline: "Set Routine Equipment Maintenance")
            
            OnboardingViewCell(image: "list.clipboard.fill", headline: "Monitor equipment", subheadline: "Streamline equipment pre-inspection and servicing")
            
            OnboardingViewCell(image: "train.side.rear.car", headline: "Project Organization", subheadline: "Organize Ongoing Projects")

        }
        .multilineTextAlignment(.center)
        .padding(.horizontal, 30)
        .padding(.vertical, 40)
        .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialLight))
        .cornerRadius(30)
        .shadow(radius: 20)
        .padding(20)
        .opacity(showMessage ? 1: 0)
        .offset(y: showMessage ? 0: 220)
        .blur(radius: showMessage ? 0: 20)
        
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



struct OnboardingViewCell : View {
    let image: String
    let headline: String
    let subheadline: String
    
    var body: some View {
        VStack(spacing: 10) {
            
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: image)
                    .font(.title2)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(headline)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(subheadline)
                        .font(.headline)
                        .fontWeight(.medium)
                }
            }
        }
    }
}


struct OnboardingViewCell_Preview: PreviewProvider {
    static var previews: some View {
        MessageView()
    //    OnboardingCell(image: "clock.arrow.circlepath", headline: "Easy Formatting", subheadline: "Set specific delays")
    }
}

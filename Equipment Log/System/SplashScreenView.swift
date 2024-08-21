//
//  SplashScreenView.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 8/20/24.
//

import Foundation
import SwiftUI

struct SplashScreenView: View {
    @State private var isActive: Bool = false
    @State private var size: CGFloat = 0.8
    @State private var opacity: Double = 0.5
    @State private var isAnimating: Bool = false
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            splashMain()
        }

    }
}


struct SplashScreenView_Preview: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

extension SplashScreenView {
    @ViewBuilder
    func splashMain() -> some View {
        VStack() {
            VStack(spacing: 16) {
                Image("DailyReportLogo")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .shadow(color: .black, radius: 3, x: 5, y: 5)
                    .frame(width: 126, height: 126)
                
            //    Image(systemName: "hare.fill")
                    .font(.system(size: 80, design: .rounded))
                    .foregroundStyle(Color.gray).opacity(0.8)
                    .shadow(radius: 6)
                
                Text("EquipIT")
                    .fontWeight(.semibold)
                    .font(.system(size: 38, design: .rounded))
                    .font(isAnimating ? .largeTitle : .body)
                    .animation(.easeInOut(duration: 1), value: isAnimating)
                    .foregroundColor(Color.black).opacity(0.7)
                    
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear(perform: {
                withAnimation(.easeIn(duration: 1.2)) {
                    self.size = 0.9
                    self.opacity = 1.0
                }
            })
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                withAnimation {
                    self.isActive = true
                    self.isAnimating = true
                }
    
            })
        })
        
    }
        
}

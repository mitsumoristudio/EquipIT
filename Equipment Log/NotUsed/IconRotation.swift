//
//  SearchBar.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 8/17/24.
//

import Foundation
import SwiftUI
import UIKit

struct IconRotation: View {
    @State var degreesRotation = 0.0
    
    var body: some View {
        VStack() {
            Image(systemName: "wind.circle")
                .font(.system(size: 26, design: .rounded))
                .foregroundColor(Color.black).opacity(0.7)
                .saturation(4.0)
                .rotationEffect(.degrees(degreesRotation))
            
                .onAppear {
                    withAnimation(.linear(duration: 1)
                        .speed(0.1).repeatForever(autoreverses: false)) {
                            degreesRotation = 360
                        }
                }
        }
    }
}

struct IconRotation_Preview: PreviewProvider {
    static var previews: some View {
        IconRotation()
    }
}

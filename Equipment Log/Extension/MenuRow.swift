//
//  MenuRow.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 6/28/24.
//

import Foundation
import SwiftUI

struct MenuRow: View {
    var title: String = ""
    var leftIcon: String = "target"
    var rightIcon: String = "chevron.right"
    
    var body: some View {
        HStack(spacing: 12.0) {
            GradientIconButton(icon: leftIcon)
            
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Spacer()
            
            Image(systemName: rightIcon)
                .fontWeight(.semibold)
                .font(.system(size: 15))
                .opacity(0.4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}



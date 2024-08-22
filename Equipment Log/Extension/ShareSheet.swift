//
//  ShareSheet.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 7/4/24.
//

import Foundation
import SwiftUI
import UIKit

struct ShareSheet: UIViewControllerRepresentable {
    var items: [Any]
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let view = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return view
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
    
}

// MARK: used as bottomsheet to present the PDF View

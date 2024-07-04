//
//  PDFPrintView.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 8/17/24.
//

import Foundation
import SwiftUI
import UIKit
import PDFKit

//struct PDFPrintView: UIViewControllerRepresentable {
//    var pdfData: Data
//
//    func makeUIViewController(context: Context) -> UIViewController {
//        let viewController = UIViewController()
//
//        // Configure the print controller
//        let printController = UIPrintInteractionController.shared
//        let printInfo = UIPrintInfo.printInfo()
//        printInfo.outputType = .general
//        printController.printInfo = printInfo
//        printController.printingItem = pdfData
//        
//        // Present the print controller
//        printController.present(animated: true, completionHandler: nil)
//
//        return viewController
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
//}

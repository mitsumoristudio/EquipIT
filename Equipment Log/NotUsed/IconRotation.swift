//
//  SearchBar.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 8/17/24.
//

//import Foundation
//import SwiftUI
//import UIKit
//
//struct SearchBar: UIViewRepresentable {
//    @Binding var text: String
//
//      class Coordinator: NSObject, UISearchBarDelegate {
//          var parent: SearchBar
//
//          init(parent: SearchBar) {
//              self.parent = parent
//          }
//
//          func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//              parent.text = searchText
//          }
//      }
//
//      func makeCoordinator() -> Coordinator {
//          Coordinator(parent: self)
//      }
//
//      func makeUIView(context: Context) -> UISearchBar {
//          let searchBar = UISearchBar()
//          searchBar.delegate = context.coordinator
//          return searchBar
//      }
//
//      func updateUIView(_ uiView: UISearchBar, context: Context) {
//          uiView.text = text
//      }
//}

//
//  MainTabView.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 6/28/24.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        VStack(spacing: 5) {
            TabView {
                ProjectListView()
          
                    .tabItem {
                        VStack() {
                            Image(systemName: "plus.rectangle.on.folder.fill")
                            Text("Projects")
                        }
                    }
                    .tag(0)
                
//                ProjectAddView(needtoRefresh: .constant(true))
//               
//                    .tabItem {
//                        VStack() {
//                            Image(systemName: "plus.rectangle.on.folder.fill")
//                            
//                            Text("Add Project")
//                        }
//                    }
//                    .tag(1)
                
                HeavyEquipListView()
                    .tabItem {
                        VStack() {
                            Image(systemName: "lightrail")
                            Text("Equipment")
                        }
                    }
                    .tag(1)
                
                SetUpView()
                    .tabItem {
                        VStack() {
                            Image(systemName: "gearshape.fill")
                            Text("Settings")
                        }
                    }
                    .tag(2)
            }
        }
    }
}

struct MainTabView_Preview: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}




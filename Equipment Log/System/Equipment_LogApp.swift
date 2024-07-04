//
//  Equipment_LogApp.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 6/28/24.
//

import SwiftUI

@main
struct Equipment_LogApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  BarChartExample.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 8/18/24.
//

//import Foundation
//import SwiftUI
//import Charts
//
//struct BarChartExample: View {
//    @Environment(\.managedObjectContext) var viewContext
//    
//    @FetchRequest(entity: ProjectEntity.entity(),
//                  sortDescriptors: [NSSortDescriptor(keyPath: \ProjectEntity.projectName, ascending: true)]) var projects: FetchedResults<ProjectEntity>
//    
//    var body: some View {
//        
//        VStack(alignment:.leading, spacing: 10) {
//            Chart {
//                ForEach(projects, id:\.self) { items in
//                    BarMark(x: .value("Project", items.projectName ?? "NA"), y: .value("Dates", items.location ?? "NA"))
//                }
//            }
//            
//        }
//    }
//}
//
//struct BarChartPreview: PreviewProvider {
//    static var previews: some View {
//        BarChartExample()
//    }
//}

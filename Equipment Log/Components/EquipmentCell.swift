//
//  EquipmentCell.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 7/1/24.
//

import SwiftUI

struct EquipmentCell: View {
    
    @State var projectName: String
    @State var projectLocation: String
    @State var projectClient: String
    @State private var showPrintView: Bool = false
    
    @ObservedObject var equipments = EquipmentEntity()
    @State var backgroundGradient =  AngularGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1))]), center: .center, angle: .degrees(70))
    @Environment(\.dismiss) var dismiss

    var body: some View {
        // MARK: Dont add Scrowview, Scrow view limits the PDF from printing
       // ScrollView() {
            ZStack() {
                LazyVStack(alignment: .leading, spacing: 15) {
                    VStack(alignment: .leading, spacing: 15) {
                        
                        LabeledContent {
                            Text(projectName)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Project: ")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(projectLocation)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Location: ")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(projectClient)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Client: ")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.equipmentName ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                            // passed from @ObservedObject from entities in CoreData
                            
                        } label: {
                            Text("Equipment: ")
                                .fontWeight(.semibold)
                                .font(.headline)
                            
                        }
                        LabeledContent {
                            Text(equipments.inspectionDate ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Inspection Date: ")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.overall ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Overall Machine Appearance ")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.grabbars ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Ropes, Grab Bars, Steps, Hand Holds")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.frame ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Frame and Undercarriage")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.harnessses ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Lights, Harnesses, Electrical Items")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.tires ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Tires, Rims, Wheel Locks/ Tracks")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.undertheMachine ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Under the Machine")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.belts ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Belts, Hoses, Hydraulic Cylinders")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.coolerCores ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Cooler Cores")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.cabWindows ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Cab Windows")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.overallCleanliness ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Overall Cleansliness")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.operatorManaul ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Operation Manual Present")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.seats ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Seat, Seat Belt, Buckle, Mount")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.mirrors ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Mirror and Rear View Camera")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.windshield ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("WindShield Wipers")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.defroster ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Defroster")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.gauges ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Gauges, Indicator Lights, Switches")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.fuel ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Fuel")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.fireExtinguisher ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Fire Extinguisher")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.horn ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Horn")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.parkBrakes ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Brakes")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.steering ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Steering")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.travelAlarms ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Travel & Backup Alarms")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.diagnostic ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Diagnostic Trouble Code")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.engineOils ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Engine Oils")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.hydraulicOils ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Hydraulic Oil")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.transmissionOil ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Transmission Oil")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        LabeledContent {
                            Text(equipments.engineCoolant ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Engine Coolant")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        
                        LabeledContent {
                            Text(equipments.def ?? "")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .font(.subheadline)
                            
                        } label: {
                            Text("Def")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                    }
                }
                .padding()
                
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 10)
                
                //    .navigationBarBackButtonHidden(true)
                //  }
                .background(backgroundGradient)
                .ignoresSafeArea(.all, edges: [.top])
            }
        
            //            .toolbar {
            //                ToolbarItem(placement: .navigationBarLeading, content: {
            //                    NavigationLink(destination: {
            //                      dismiss()
            //                    }, label: {
            //                        Image(systemName: "chevron.backward.circle")
            //                            .foregroundColor(Color.white)
            //                            .background(Color.black, in: Circle())
            //                            .font(.title2)
            //                    })
            //                })
            //            }
     //   }
    }
}
    

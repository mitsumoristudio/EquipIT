//
//  InspectionView.swift
//  Equipment Log
//
//  Created by Satoshi Mitsumori on 6/28/24.
//

import SwiftUI

struct InspectionView: View {
    // MARK: Create Equipment Inspection
    
    var backgroundGradient = Color(#colorLiteral(red: 0.7869432202, green: 0.8728674827, blue: 0.8820440269, alpha: 0.6454884106))
    @State var dateSelect: Date = Date()
    @State var showAlertIcon: Bool = false
    @State var isCompleted: Bool = false
    @State var equipmentName: String = ""
    @FocusState private var focusedTextField: Bool
    
    // MARK: Array for choosing through the segmented Picker
    var yesNoArray: Array = ["N/A", "YES", "NO"]
    var safeArray: Array = ["N/A", "Safe", "At Risk"]
    
    @State var naSelectionOverall: String = "N/A"
    @State var naGrabbars: String = "N/A"
    @State var naFrame: String = "N/A"
    @State var naharnesses: String = "N/A"
    @State var natires: String = "N/A"
    @State var naundertheMachine: String = "N/A"
    @State var nabelts: String = "N/A"
    @State var naCoolerCores: String = "N/A"
    
    // MARK: Int the Operators Cab
    @State var naCabWindows: String = "N/A"
    @State var naoverallCleanliness: String = "N/A"
    @State var naoperatorManual: String = "N/A"
    @State var naSeats: String = "N/A"
    @State var naMirror: String = "N/A"
    @State var nawwindShield: String = "N/A"
    @State var nadefroster: String = "N/A"
    @State var nagauges: String = "N/A"
    @State var nafuel: String = "N/A"
    @State var nafireExtinguisher: String = "N/A"
    @State var nahorn: String = "N/A"
    @State var naparkBrakes: String = "N/A"
    @State var naSteering: String = "N/A"
    @State var natravelAlarm: String = "N/A"
    @State var naDiagnostic: String = "N/A"
    
    // MARK: Fluids
    @State var naEngineOils: String = "N/A"
    @State var nahydraulicOils: String = "N/A"
    @State var natransmissionOil: String = "N/A"
    @State var naengineCoolant: String = "N/A"
    @State var naDef: String = "N/A"
    
    var arrayProjects = ["Project Pearl", "Amazon", "Bojangles"]

    @State var selectedProjects = ProjectEntity()
    // Sets the state to use dropdown list from entities
    
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.managedObjectContext) var viewContent
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ProjectEntity.projectName, ascending: true)]) private var projects: FetchedResults<ProjectEntity>
    // MARK: Used fetchRequest to create drop down list to save the specific project associated with equipment
    
    var body: some View {
        NavigationStack {
            
            ZStack() {
                VStack(alignment: .leading, spacing: 10) {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        // MARK: Date Picker
                        HStack(alignment: .bottom, spacing: 10) {
                            HStack(spacing: 12) {
                                titleView("Date", color: .black)
                                    .padding(.vertical, 10)
                                
                                Text(dateSelect.toString("EEEE dd, MMMM"))
                                    .font(.headline)
                                
                                Image(systemName: "calendar")
                                    .font(.title2)
                                    .foregroundColor(Color.blue).opacity(0.75)
                                    .overlay {
                                        DatePicker("", selection: $dateSelect, displayedComponents: [.date])
                                            .blendMode(.destinationOver)
                                    }
                            }
                            .offset(y: -5)
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .fill(.black.opacity(0.8))
                                    .frame(height: 1)
                                    .offset(y: 5)
                            }
                        }
                        .padding(.horizontal, 10)
                        
                        VStack(alignment: .leading) {
                            HStack() {
                                Text("Equipment")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                TextField("Enter Equipment Model", text: $equipmentName)
                                    .font(.headline)
                                    .fontWeight(.medium)
                                    .padding(.top, 2)
                                    .modifier(TextFieldClearButton(nextText: $equipmentName))
                                    .focused($focusedTextField)
                                    .onSubmit {
                                        focusedTextField.toggle()
                                    }
                            }
                            
                            Rectangle()
                                .fill(Color.black.opacity(0.5))
                                .frame(maxHeight: 1.2)
                            
                            HStack() {
                                Picker("Select Project Name", selection: $selectedProjects) {
                                    ForEach(projects, id: \.self) { items in
                                        Text(items.projectName ?? "")
                                        
                                    }
                                }
                                .pickerStyle(.navigationLink)
                               // .pickerStyle(.menu)
                            }
                            
                            Rectangle()
                                .fill(Color.black.opacity(0.5))
                                .frame(maxHeight: 1.2)
                            
                            Text("The Periodic Maintenance Checklist as outlined in the Operator's Manual has been completed and any necessary maintenance items have been addressed")
                                .fontWeight(.medium)
                                .font(.caption)
                                .foregroundStyle(Color.secondary)
                        }
                        .padding()
                        
                        Group {
                            // MARK: Add Equipment Daily Inspection Here
                            // PreEquipment Checklist UI embedded here
            
                            preEquipmentCheckList()
                        }
                        
                    // MARK:
                        Button(action: {
                            
                            // MARK: function to save Entities to Core Data
                            addEquipmentsToProjects()
                            
                            dismiss()
                        }, label: {
                            
                            buttonLabel(placeholder: "Save")
                        })
                        .frame(minWidth: 220, minHeight: 60)
                        .offset(x: 80)
                        .padding(.horizontal, 10)
                    }
                    .background(backgroundGradient)
                }
            }
            .navigationTitle("Equipment Pre-Inspection")
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading, content: {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.backward.circle")
                        .foregroundColor(Color.white)
                        .background(Color.black, in: Circle())
                        .font(.title)
                })
            })
        }
    }
}

struct InspectionView_Preview: PreviewProvider {
    static var previews: some View {
        InspectionView()
    }
}

extension InspectionView {
    // MARK: Function to add entties to coreData
    
    func addEquipmentsToProjects() {
        let timeNow = DateFormatter()
        timeNow.dateStyle = .full
        timeNow.timeStyle = .none
        let laterTimeNow = timeNow
        let dateOnlyFormat = laterTimeNow.string(from: dateSelect)
        // MARK: Sets the date to string
        
        
        let newEquipment = EquipmentEntity(context: viewContent)
        newEquipment.windshield = nawwindShield
        newEquipment.undertheMachine = naundertheMachine
        newEquipment.travelAlarms = natravelAlarm
        newEquipment.transmissionOil = natransmissionOil
        newEquipment.tires = natires
        newEquipment.steering = naSteering
        newEquipment.inspectionDate = dateOnlyFormat
        // MARK: Date Select add here
        newEquipment.seats = naSeats
        newEquipment.parkBrakes = naparkBrakes
        newEquipment.overallCleanliness = naoverallCleanliness
        newEquipment.overall = naSelectionOverall
        newEquipment.operatorManaul = naoperatorManual
        newEquipment.mirrors = naMirror
        newEquipment.hydraulicOils = nahydraulicOils
        newEquipment.horn = nahorn
        newEquipment.harnessses = naharnesses
        newEquipment.grabbars = naGrabbars
        newEquipment.gauges = nagauges
        newEquipment.fuel = nafuel
        newEquipment.frame = naFrame
        newEquipment.fireExtinguisher = nafireExtinguisher
        newEquipment.equipmentName = equipmentName
        newEquipment.engineOils = naEngineOils
        newEquipment.engineCoolant = naengineCoolant
        newEquipment.diagnostic = naDiagnostic
        newEquipment.defroster = nadefroster
        newEquipment.def = naDef
        newEquipment.coolerCores = naCoolerCores
        newEquipment.cabWindows = naCabWindows
        newEquipment.belts = nabelts
        newEquipment.equipmenttoProject = selectedProjects
        
        do {
            try viewContent.save()
            
            print(equipmentName)
            print(selectedProjects)
            print(dateOnlyFormat)
            print(nafuel)
            
        } catch let error {
            print("Error found while saving to Core Data \(error.localizedDescription)")
        }
    }
    
    // MARK: ButtonLabel custom func
    
    private func buttonLabel(placeholder: String) -> some View {
        Text(placeholder)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
            .frame(maxWidth: 1000, maxHeight: 56, alignment: .center)
        //    .frame(width: 160, height: 46)
            .background(.indigo)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.vertical, 30)
            .offset(x: -80, y: 0)
    }
    
    private func titleView(_ value: String, color: Color = .black.opacity(0.9)) -> some View {
        Text(value)
            .font(.system(size: 18))
            .foregroundStyle(color)
            .fontWeight(.semibold)
    }
}

// MARK: Equipment Maintenance list UI
extension InspectionView {
    @ViewBuilder
    func preEquipmentCheckList() -> some View {
        VStack() {
            List {
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("From the Grounds")
                        .fontWeight(.medium)
                        .font(.headline)
                        .underline()
                    
                    HStack(spacing: 0) {
                        Text("Overall Machine Appearance")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naSelectionOverall, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Ropes, Grab Bars, Steps, Hand Holds")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naGrabbars, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Frame and Undercarriage")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naFrame, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Lights, Harnesses, Electrical Items")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naharnesses, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Tires, Rims, Wheel Locks/ Tracks")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $natires, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Under the Machine")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naundertheMachine, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Belts, Hoses, Hydraulic Cylinders")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $nabelts, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Cooler Cores")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naCoolerCores, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Cab Windows")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naCabWindows, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Overall Cleansliness")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naoverallCleanliness, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Operation Manual Present")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naoperatorManual, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Seat, Seat Belt, Buckle, Mount")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naSeats, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Mirror and Rear View Camera")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naMirror, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("WindShield Wipers")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $nawwindShield, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Defroster")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $nadefroster, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Gauges, Indicator Lights, Switches")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $nagauges, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Fuel")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $nafuel, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Fire Extinguisher")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $nafireExtinguisher, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Horns")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $nahorn, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Brakes")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naparkBrakes, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Steering")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naSteering, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Travel & Backup Alarm")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $natravelAlarm, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Diagnostic Trouble Code")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naDiagnostic, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Engine Oil")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naEngineOils, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Hydraulic Oil")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $nahydraulicOils, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Transmission Oil")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $natransmissionOil, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Engine Coolant")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naengineCoolant, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Def")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naDef, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    }
                }
            }
        }
    }


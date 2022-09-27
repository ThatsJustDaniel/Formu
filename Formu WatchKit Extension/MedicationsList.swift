//
//  MedicationsList.swift
//  formuWatch WatchKit Extension
//
//  Created by Daniel Ortiz on 10/8/21.
//

import SwiftUI

struct MedicationsList: View {
    
    var medications: [Medication] = []
    
    var body: some View {
        
        List(medications) { medication in
            
            MedicationCell(medication: medication)

//                .listRowBackground(Capsule()
//                                                        .background(Color.clear)
//                                                        .foregroundColor(.teal)
////                                                        .opacity(0.5)))
//                                                    )
                
        }
//        .foregroundColor(.light)
        .navigationTitle(Text("Medications"))
//        .listStyle(PlainListStyle())

    }


}

struct MedicationsList_Previews: PreviewProvider {
    static var previews: some View {
        MedicationsList(medications: testData)
    }
}



struct MedicationCell: View {
    
    let medication: Medication
    var body: some View {
        
        return NavigationLink(destination: MedicationDetail(name: medication.name, indications: medication.indications, contraindications: medication.contraindications, sideEffects: medication.sideEffects, adultDosage: medication.adultDosage, pediatricDosage: medication.pediatricDosage, vialConcentration: medication.vialConcentration)) {
            
            VStack(alignment: .center) {
                
                Text(medication.name)
                
                    .font(.headline)
                
                //                    .color(.gray)
                
            }
            
        }
        
        
    }
}


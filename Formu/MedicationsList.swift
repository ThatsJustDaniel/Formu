//
//  MedicationsList.swift
//  formuWatch WatchKit Extension
//
//  Created by Daniel Ortiz on 10/8/21.
//

import SwiftUI

struct MedicationsList: View {
    
    var medications: [MedicationData] = []
    
    var body: some View {
        
        
        
        ZStack {
            Color(hex: "073B4C")
                .edgesIgnoringSafeArea(.all)
        
 
        List(medications) { medication in
            
            
            
            MedicationCell(medication: medication)
            
                .listRowSeparator(.hidden)
                .frame( height: 50, alignment: .center)
                .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 7, trailing: 10))
                .listRowSeparator(.hidden)
                .background(Color(hex: "06D6A0")).brightness(-0.15)
                .cornerRadius(10)
                .listRowBackground(Color(hex: "073B4C"))
            
        
            
        }
        .background(Color(hex: "073B4C"))
        .listStyle(PlainListStyle())
        .navigationTitle(Text("Medications"))
        
        
    
    }
        
    
    

    }


}

struct MedicationsList_Previews: PreviewProvider {
    static var previews: some View {
        MedicationsList(medications: testData)
    }
}



struct MedicationCell: View {
    
    let medication: MedicationData
    var body: some View {
        
      
        return NavigationLink(destination: MedicationDetail(name: medication.name, indications: medication.indications, contraindications: medication.contraindications, sideEffects: medication.sideEffects, adultDosage: medication.adultDosage, pediatricDosage: medication.pediatricDosage, vialConcentration: medication.vialConcentration)) {
            
    
            VStack(alignment: .center) {
                
                
                Text(medication.name)
                
//                    .font(.headline)
                    .font(.system(.title3, design: .rounded))
                    .bold()
                    .padding()
                
                    
//                                    .color(.gray)
                
            }
            
        
            
        }
        .padding([.trailing], -30.0)
        
    
        
    }
}




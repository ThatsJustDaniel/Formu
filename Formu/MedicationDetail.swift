//
//  MedicationDetail.swift
//  formuWatch WatchKit Extension
//
//  Created by Daniel Ortiz on 10/8/21.
//

import SwiftUI

struct MedicationDetail: View {
    
    var name: String
    
    var indications: String
    
    var contraindications: String
    
    var sideEffects: String
    
    var adultDosage: String
    
    var pediatricDosage: String
    
    var vialConcentration: String
    
    
    var body: some View {
        
        ZStack {
            Color(hex: "073B4C")
                .edgesIgnoringSafeArea(.all)
        
        VStack {
            
            ScrollView {
            
            Group {
                
                Text(name)
//                    .font(.title2)
//                    .font(.headline)
                    .font(.largeTitle)
                    .bold()
                    .lineLimit(50)
                    .multilineTextAlignment(.center)
                    
                    .padding()
                    .padding()
                
                Text("Indications:")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(Color.green)
                
                Text(indications)
                    .fontWeight(.semibold)
                    .lineLimit(50)
                    .padding()
                
                
                
                Group {
                    
                    Text("Contraindications:")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(Color.red)
                    Text(contraindications)
                        .fontWeight(.semibold)
                        .lineLimit(50)
                        .padding()
                    
                    
                    Text("Side Effects:")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(Color.orange)
                    Text(sideEffects)
                        .fontWeight(.semibold)
                        .lineLimit(50)
                        .padding()
                    
                    
                }
                
// MARK: REMOVED DOSAGES DUE TO APPLE GUIDELINES
                
                
                Group {

                    Text("Adult Dosage:")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(Color.blue)
                    Text(adultDosage)
                        .fontWeight(.semibold)
                        .lineLimit(50)
                        .padding()


                    Text("Pediatric Dosage:")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(Color.pink)
                    Text(pediatricDosage)
                        .fontWeight(.semibold)
                        .lineLimit(50)
                        .padding()


                    Text("Vial Concentration:")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(Color.yellow)
                    Text(vialConcentration)
                        .fontWeight(.semibold)
                        .padding()
                }
                
         
          
            }
        
        }
            
        }
        
    }
        .foregroundColor(.white)
}

}

struct MedicationDetail_Previews: PreviewProvider {
    static var previews: some View {
        MedicationDetail(name: "Adenosine", indications: "Stable Narrow Complex SVT, may be used for unstable narrow-complex reentry tachycardia while preparing for Cardioversion", contraindications: "Poison/Drug induced tachycardia, Second and Third degree blocks", sideEffects: "Facial flushing, chest pain or tightness, brief periods of asystole or bradycardia, ventricular ectopy", adultDosage: "6mg Rapid IV Push with 10cc NS Flush. 12mg Rapid IV Push with 10cc NS Flush", pediatricDosage: "0.1mg/kg max is 6mg IV Push with 5cc NS Flush. 0.2mg/kg max is 12mg IV Push with 5cc NS Flush", vialConcentration: "6mg/2mL")
    }
}



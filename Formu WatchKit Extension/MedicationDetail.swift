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
        
        VStack {
            
            ScrollView {
            
            Group {
                
                Text(name)
                    .font(.title2)
                    .lineLimit(50)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Indications:")
                    .font(.headline)
                    .foregroundColor(Color.green)
                Text(indications)
                    .lineLimit(50)
                    .padding()
                
                
                
                Group {
                    
                    Text("Contraindications:")
                        .foregroundColor(Color.red)
                    Text(contraindications)
                        .lineLimit(50)
                        .padding()
                    
                    
                    Text("Side Effects:")
                        .foregroundColor(Color.orange)
                    Text(sideEffects)
                        .lineLimit(50)
                        .padding()
                    
                    
                }
                
                
   // MARK: REMOVED DOSAGES DUE TO APPLE GUIDELINES
                
                
                
                Group {
                    
                    Text("Adult Dosage:")
                        .foregroundColor(Color.blue)
                    Text(adultDosage)
                        .lineLimit(50)
                        .padding()
                    
                    
                    Text("Pediatric Dosage:")
                        .foregroundColor(Color.pink)
                    Text(pediatricDosage)
                        .lineLimit(50)
                        .padding()
                    
                    
                    Text("Vial Concentration:")
                        .foregroundColor(Color.yellow)
                    Text(vialConcentration)
                        .padding()
                }
                
                
                
          
            }
        
        }
            
        }
        // change the background color here!
//        .background(Color.mint)
//        .foregroundColor(.black)
        
    }
    
}

struct MedicationDetail_Previews: PreviewProvider {
    static var previews: some View {
        MedicationDetail(name: "Adenosine", indications: "Stable Narrow Complex SVT, may be used for unstable narrow-complex reentry tachycardia while preparing for Cardioversion", contraindications: "Poison/Drug induced tachycardia, Second and Third degree blocks", sideEffects: "Facial flushing, chest pain or tightness, brief periods of asystole or bradycardia, ventricular ectopy", adultDosage: "6mg Rapid IV Push with 10cc NS Flush. 12mg Rapid IV Push with 10cc NS Flush", pediatricDosage: "0.1mg/kg max is 6mg IV Push with 5cc NS Flush. 0.2mg/kg max is 12mg IV Push with 5cc NS Flush", vialConcentration: "6mg/2mL")
    }
}


//
//  handtevy.swift
//  formuWatch WatchKit Extension
//
//  Created by Daniel Ortiz on 10/12/21.
//

import SwiftUI

struct handtevyView: View {
    
    var ages: [HandtevyTemplate] = []
    
    var body: some View {
          
    
            List(ages) { age1 in

                HandtevyCell(age: age1)
                
                    .listRowSeparator(.hidden)
                    .frame( height: 115, alignment: .center)
                    .listRowInsets(EdgeInsets(top: 15, leading: 10, bottom: 0, trailing: 10))
                    .listRowSeparator(.hidden)
                    .background(Color(hex: "06D6A0")).brightness(-0.15)
                    .cornerRadius(10)
                    .listRowBackground(Color(hex: "073B4C"))
                
                
                
                
            }
            .background(Color(hex: "073B4C"))
            .listStyle(PlainListStyle())
            .navigationTitle(Text("Handtevy"))
        
   
}
    
}

struct handtevy_Previews: PreviewProvider {
    
    static var previews: some View {
        
        
//        ContentView().preferredColorScheme(.dark)
        
        handtevyDetail(name: "1 Yr / 10kg", epiIM: "0.1 mL", epiIV: "1 mL", ami: "1 mL", sodiumBicarb: "10 mL", d50:"20 mL", normalSaline: "200 mL", lorazepam: "0.5 mL", diazepam: "0.4 mL", tubes: "4U/-/2", d25: "", dex: false)
        
//        handtevyDetail(name: age.name, epiIM: age.epiIM, epiIV: age.epiIV, ami: age.ami, sodiumBicarb: age.sodiumBicarb, lorazepma: age.lorazepam)
    }
}

struct HandtevyCell: View {

    let age: HandtevyTemplate

    var body: some View {

        
        
        
        return NavigationLink(destination: handtevyDetail(name: age.name, epiIM: age.epiIM, epiIV: age.epiIV, ami: age.ami, sodiumBicarb: age.bicarb, d50: age.d50, normalSaline: age.normalSaline, lorazepam: age.lorazepam, diazepam: age.diazepam, tubes: age.tubes, d25: age.d25, dex: age.dex)) {

            VStack(alignment: .center) {

                Text(age.name)
                    .font(.headline)
                    .font(.system(.title3, design: .rounded))
                    .bold()
                    .padding()

                //                    .color(.gray)

            }



        }
        .padding([.trailing], -30.0)
//            .listRowPlatterColor(Color.purple)
//            .font(.headline)
    }
}


struct HandtevyTemplate: Identifiable {
    var id = UUID()
    var name: String
    var epiIM: String
    var epiIV: String
    var ami: String
    var bicarb: String
    var d50: String
    var normalSaline: String
    var lorazepam: String
    var diazepam: String
    var tubes: String
    var d25: String
    var dex: Bool
    
}

let handtevyTestData = [
    HandtevyTemplate(name: "1 Yr / 10kg", epiIM: "0.1 mL", epiIV: "1 mL", ami: "1 mL", bicarb: "10 mL", d50:"20 mL", normalSaline: "200 mL", lorazepam: "0.5 mL", diazepam: "0.4 mL", tubes: "4U/-/2", d25: "", dex: false),
    HandtevyTemplate(name: "3 Yr / 15kg", epiIM: "0.15 mL", epiIV: "1.5 mL", ami: "1.5 mL", bicarb: "15 mL", d50: "30 mL", normalSaline: "300 mL", lorazepam: "0.75 mL", diazepam: "0.6 mL", tubes: "5U/2/2", d25: "", dex: false),
    HandtevyTemplate(name: "5 Yr / 20kg", epiIM: "0.2 mL", epiIV: "2 mL", ami: "2 mL", bicarb: "20 mL", d50: "40 mL", normalSaline: "400 mL", lorazepam: "1 mL", diazepam: "0.8 mL", tubes: "5.5U/2/2.5", d25: "", dex: false),
    HandtevyTemplate(name: "7 Yr / 25kg", epiIM: "0.25 mL", epiIV: "2.5 mL", ami: "2.5 mL", bicarb: "25 mL", d50: "50 mL", normalSaline: "500 mL", lorazepam: "1.25 mL", diazepam: "1 mL", tubes: "6C/3/2.5", d25: "", dex: false),
    HandtevyTemplate(name: "9 Yr / 30kg", epiIM: "0.3 mL", epiIV: "3 mL", ami: "3 mL", bicarb: "30 mL", d50: "30 mL", normalSaline: "600 mL", lorazepam: "1.5 mL", diazepam: "1.2 mL", tubes: "6.5C/3/3", d25: "30 mL", dex: true)
    
]





struct handtevyDetail: View {
    
 
    var name: String
    var epiIM: String
    var epiIV: String
    var ami: String
    var sodiumBicarb: String
    var d50: String
    var normalSaline: String
    var lorazepam: String
    var diazepam: String
    var tubes: String
    var d25: String
    var dex : Bool
        
    
    lazy var dextrose = dex ? "d50w" : "d25w"
    
    var handtevyMed = ["Epinephrine 1:1,000 IM", "Epinephrine 1:10,000 IV", "Amiodarone", "Sodium Bicarbonate 8.4%", "d25w", "Normal Saline", "Lorazepam", "Diazepam IM/IN", "ETT/King/LMA"]
    
    
    
    var body: some View {
        
        

            // I design the look of the table row here
        List{
            
            
    
            ExtractedHandtevyView(Hname: handtevyMed[0], Hdosage: epiIM)
            ExtractedHandtevyView(Hname: handtevyMed[1], Hdosage: epiIV)
            ExtractedHandtevyView(Hname: handtevyMed[2], Hdosage: ami)
            ExtractedHandtevyView(Hname: handtevyMed[3], Hdosage: sodiumBicarb)
            ExtractedHandtevyView(Hname: dex ? "d50w" : "d25w", Hdosage: d50)
            ExtractedHandtevyView(Hname: handtevyMed[5], Hdosage: normalSaline)
            ExtractedHandtevyView(Hname: handtevyMed[6], Hdosage: lorazepam)
            ExtractedHandtevyView(Hname: handtevyMed[7], Hdosage: diazepam)
            ExtractedHandtevyView(Hname: handtevyMed[8], Hdosage: tubes)
            
            
            VStack{
                padding()
                Text("Concentrations:")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.red)
                    .padding(.bottom)
                Text("Epi 1:1,000 IM    1 mg/ mL")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding(.bottom)
                Text("Epi 1:10,000 IV    1 mg/10 mL")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding(.bottom)
                Text("Amiodarone    150 mg/3 mL")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding(.bottom)
                Text("Bicarb 8.4%    50 mEq/50 mL")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding(.bottom)
                Text("D25W    0.25 g/mL")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding(.bottom)
                Text("Normal Saline Bolus    0.9%")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding(.bottom)
                Text("Lorazepam    2 mg/ mL")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding(.bottom)
                Text("Diazepam    10 mg/ 2 mL")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding(.bottom)
                
            }
            .listRowSeparator(.hidden)
    //        .frame( height: 50, alignment: .center)
            .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            .listRowSeparator(.hidden)
//            .background(Color(hex: "06D6A0")).brightness(-0.15)
            .cornerRadius(10)
            .listRowBackground(Color(hex: "073B4C"))
            
    }
        
        
        .background(Color(hex: "073B4C"))
        .listStyle(PlainListStyle())
        .navigationTitle(Text(name))
        
        
        
    }
           

    
    }

    

struct ExtractedHandtevyView: View {
    
    var Hname: String
    var Hdosage : String
    
    var body: some View {
        HStack {
            Text(Hname)
                .font(.headline)
                .padding()
            Spacer()
            Text(Hdosage)
                .font(.headline)
                .frame(height:25)
                .padding()
        }
        .listRowSeparator(.hidden)
//        .frame( height: 50, alignment: .center)
        .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
        .listRowSeparator(.hidden)
        .background(Color(hex: "06D6A0")).brightness(-0.15)
        .cornerRadius(10)
        .listRowBackground(Color(hex: "073B4C"))
        
    }
}



// DOING EVERYTHING AGAIN

//Database

let oneYear = ["epinephrine 1:1,000": "0.1 mL", "epinephrine 1:10,000": "1 mL", "amiodarone": "1 mL", "sodium bicarbonate": "10 mL", "d25w": "20 mL", "normal saline": "200 mL", "lorazepam": "0.5 mL", "diazepam": "0.4 mL", "tubes": "4U/-/2"]

let threeYears = ["epinephrine 1:1,000": "0.15 mL", "epinephrine 1:10,000": "1.5 mL", "amiodarone": "1.5 mL", "sodium bicarbonate": "15 mL", "d25w": "30 mL", "normal saline": "300 mL", "lorazepam": "0.75 mL", "diazepam": "0.6 mL", "tubes": "5U/2/2"]

let fiveYears = ["epinephrine 1:1,000": "0.2 mL", "epinephrine 1:10,000": "2 mL", "amiodarone": "2 mL", "sodium bicarbonate": "20 mL", "d25w": "40 mL", "normal saline": "400 mL", "lorazepam": "1 mL", "diazepam": "0.8 mL", "tubes": "5.5U/2/2.5"]

let sevenYears = ["epinephrine 1:1,000": "0.25 mL", "epinephrine 1:10,000": "2.5 mL", "amiodarone": "2.5 mL", "sodium bicarbonate": "25 mL", "d25w": "50 mL", "normal saline": "500 mL", "lorazepam": "1.25 mL", "diazepam": "1 mL", "tubes": "6C/3/2.5"]

let nineYears = ["epinephrine 1:1,000": "0.3 mL", "epinephrine 1:10,000": "3 mL", "amiodarone": "3 mL", "sodium bicarbonate": "30 mL", "d50w": "30 mL", "normal saline": "600 mL", "lorazepam": "1.5 mL", "diazepam": "1.2 mL", "tubes": "6.5C/3/3"]



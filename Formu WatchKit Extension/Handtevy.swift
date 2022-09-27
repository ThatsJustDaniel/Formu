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

//                    .listRowBackground(Capsule()
//                                                            .background(Color.clear)
//                                                            .foregroundColor(.teal)
//    //                                                        .opacity(0.5)))
//                                                        )
            }
//            .foregroundColor(.black)
            .navigationTitle(Text("Handtevy"))
        
    
}
}

struct handtevy_Previews: PreviewProvider {
    
    static var previews: some View {
        handtevyView(ages: handtevyTestData)
//        handtevyDetail(name: age.name, epiIM: age.epiIM, epiIV: age.epiIV, ami: age.ami, sodiumBicarb: age.sodiumBicarb, lorazepma: age.lorazepam)
    }
}

struct HandtevyCell: View {

    let age: HandtevyTemplate

    var body: some View {
        
        

        return NavigationLink(destination: handtevyDetail(name: age.name, epiIM: age.epiIM, epiIV: age.epiIV, ami: age.ami, sodiumBicarb: age.bicarb, d50: age.d50, normalSaline: age.normalSaline, lorazepam: age.lorazepam, diazepam: age.diazepam, tubes: age.tubes, dex: age.dex)) {

            VStack(alignment: .center) {

                Text(age.name)
                    .font(.headline)

                //                    .color(.gray)
            }

        }
        
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
    var dex: Bool
    
}

let handtevyTestData = [
    HandtevyTemplate(name: "1 Yr / 10kg", epiIM: "0.1 mL", epiIV: "1 mL", ami: "1 mL", bicarb: "10 mL", d50:"20 mL", normalSaline: "200 mL", lorazepam: "0.5 mL", diazepam: "0.4 mL", tubes: "4U/-/2", dex: false),
    HandtevyTemplate(name: "3 Yr / 15kg", epiIM: "0.15 mL", epiIV: "1.5 mL", ami: "1.5 mL", bicarb: "15 mL", d50: "30 mL", normalSaline: "300 mL", lorazepam: "0.75 mL", diazepam: "0.6 mL", tubes: "5U/2/2", dex: false),
    HandtevyTemplate(name: "5 Yr / 20kg", epiIM: "0.2 mL", epiIV: "2 mL", ami: "2 mL", bicarb: "20 mL", d50: "40 mL", normalSaline: "400 mL", lorazepam: "1 mL", diazepam: "0.8 mL", tubes: "5.5U/2/2.5", dex: false),
    HandtevyTemplate(name: "7 Yr / 25kg", epiIM: "0.25 mL", epiIV: "2.5 mL", ami: "2.5 mL", bicarb: "25 mL", d50: "50 mL", normalSaline: "500 mL", lorazepam: "1.25 mL", diazepam: "1 mL", tubes: "6C/3/2.5", dex: false),
    HandtevyTemplate(name: "9 Yr / 30kg", epiIM: "0.3 mL", epiIV: "3 mL", ami: "3 mL", bicarb: "30 mL", d50: "30 mL", normalSaline: "600 mL", lorazepam: "1.5 mL", diazepam: "1.2 mL", tubes: "6.5C/3/3", dex: true),
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
    var dex: Bool
    
    
    var body: some View {
        
            
            // I design the look of the table row here
        List{
        
        HStack {
            Text("Epinephrine 1:1000 IM")
                Spacer()
            Text(epiIM)
                .frame(height:50)
        }
        HStack {
            Text("Epinephrine 10:000 IV")
            Spacer()
            Text(epiIV)
                .frame(height:50)
        }
        HStack {
            Text("Amiodarone")
            Spacer()
            Text(ami)
                .frame(height:50)
        }
        HStack {
            Text("Sodium Bicarbonate 8.4%")
            Spacer()
            Text(sodiumBicarb)
                .frame(height:50)
        }
            HStack {
                Text(dex ? "d50w" : "d25w")
                Spacer()
                Text(d50)
                    .frame(height:50)
            }
            HStack {
                Text("Normal Saline")
                Spacer()
                Text(normalSaline)
                    .frame(height:50)
            }
        HStack {
            Text("Lorazepam")
            Spacer()
            Text(lorazepam)
                .frame(height:50)
        }
            HStack {
                Text("Diazepam IM/IN")
                Spacer()
                Text(diazepam)
                    .frame(height:50)
            }
            HStack {
                Text("ETT/King/LMA")
                Spacer()
                Text(tubes)
                    .frame(height:50)
            }
            NavigationLink("Concentrations", destination: Concentrations())
                .listRowBackground(Color.red)
//                .cornerRadius(5)
            
    }
        .navigationTitle(Text(name))
        .listRowBackground(Color.teal)
    }
           
    }


struct Concentrations: View {
    
    var body: some View {
        List {
            
            Text("Concentrations:")
                .font(.headline)
//                .multilineTextAlignment(.center)
            VStack(alignment: .leading) {
                Text("Epi 1:1,000 IM")
                Text("1 mg/ mL")
            }
            VStack(alignment: .leading) {
                Text("Epi 1:10,000 IV")
                Text("1 mg/10 mL")
            }
            VStack(alignment: .leading) {
                Text("Amiodarone")
                Text("150 mg/3 mL")
            }
            VStack(alignment: .leading) {
                Text("Bicarb 8.4%")
                Text("50 mEq/50 mL")
            }
            VStack(alignment: .leading) {
                Text("D25W")
                Text("0.25 g/mL")
            }
            VStack(alignment: .leading) {
                Text("Normal Saline")
                Text("0.9%")
            }
            VStack(alignment: .leading) {
                Text("Lorazepam")
                Text("2 mg/ mL")
            }
            VStack(alignment: .leading) {
                Text("Diazepam")
                Text("10 mg/ 2 mL")
            }
           
        }
    }
}
    



// Miscellaneous

//{
//
//HStack{
//
//    Text("1 Yr / 10kg")
//
//}
//HStack{
//
//    Text("3 Yr / 15kg")
//
//}
//HStack{
//
//    Text("5 Yr / 20kg")
//
//}
//HStack{
//
//    Text("7 Yr / 25kg")
//
//}
//HStack{
//
//    Text("9 Yr / 30kg")
//
//}
//
//}
//
//


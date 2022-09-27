//
//  rsi.swift
//  formuWatch
//
//  Created by Daniel Ortiz on 3/5/22.
//

import SwiftUI


struct RSI: View {

    @State var selectedItems = Set<UUID>()

//    @State var editMode: EditMode = .active

    struct Sea: Hashable, Identifiable {
        let name: String
        let id = UUID()
    }

    struct OceanRegion: Identifiable {
        let name: String
        let seas: [Sea]
        let id = UUID()
    }

    private let oceanRegions: [OceanRegion] = [
        OceanRegion(name: "Preparation",
                    seas: [Sea(name: "EMS monitor in place"),
                           Sea(name: "Consider fluid / blood resuscitation / tension pneumothorax"),
                           Sea(name: "NRB and passive O2(>10 LPM via NC)"),
                           Sea(name: "Consider OPA / NPA utilization"),
                           Sea(name: "HOB elevated 30 - 35 degrees"),
                           Sea(name: "If SpO2 < 93%, BVM 2 thumbs-up w/PEEP + ETCO2"),
                           Sea(name: "Open C-collar if present"),
                           Sea(name: "Any HEAVEN difficult indicators?")]),
        OceanRegion(name: "Equipment",
                    seas: [Sea(name: "Suction accessible and turned on"),
                           Sea(name: "Laryngoscope on and warmed-up"),
                           Sea(name: "Verify if PDP needed"),
                           Sea(name: "Induction agent and paralytics drawn and doses confirmed"),
                           Sea(name: "ETT, Bougie, and alternate airways/cric kit out and accessible")]),
        OceanRegion(name: "Induction/ Intubation",
                    seas: [Sea(name: "Induction agent administered"),
                           Sea(name: "Wait two minutes. Administer Paralytic"),
                           Sea(name: "Suction prior to intubation"),
                           Sea(name: "Intubate"),
                           Sea(name: "ETT placement confirmed via:"),
                           Sea(name: "Direct Visualization"),
                           Sea(name: "ETCO2"),
                           Sea(name: "Breath sounds / No epigastric"),
                           Sea(name: "Tube secured and OG tube placed"),
                           Sea(name: "Administer PDP if needed"),
                           Sea(name: "Post-Intubation sedation")])
       
    ]


    @State private var singleSelection: UUID?

    @State private var multipleSelection = Set<UUID>()

    @State private var selectedItem: String?
    




    @State private var isGreen = false

//    func changeColor(item: String){
//
//     isGreen = true
//
////    if .listRowBackground(Color) == .clear
////        .listRowBackground(Color.green)
//
//            .listRowBackground(self.selectedItem == item ? Color.green : Color(UIColor.clear))
//
//        print("helloWorld")
//    }

    @State private var fgColor: Color = .clear

    func changeColor() {
        fgColor = .clear

        if fgColor == .clear {
            fgColor = .green
        } else if fgColor == .green {
            fgColor = .clear
        }
    }

    var body: some View {

//        NavigationView {
//            List(selection: $multipleSelection) {
            List {
                ForEach(oceanRegions) { region in
                    Section(header: Text(region.name)) {
                        
                        ForEach(region.seas, id: \.self) { sea in

                            Text(sea.name)
                                
                                .onTapGesture {
                                    print("tapped!")
                                    self.selectedItem = sea.name
//
//                                    changeColor()
                                    fgColor = .green
                                }

//                                .listRowBackground(fgColor)
//
//                                .listRowBackground(self.selectedItem == sea.name ? fgColor : Color(UIColor.clear))
                                


                        }

                    }

                }

            }
            .navigationTitle("RSI")
//            .toolbar { EditButton() }
//            .listStyle(.insetGrouped)
//            .environment(\.editMode, $editMode)

//        }
    }

}

struct rsiView_Previews: PreviewProvider {
    static var previews: some View {
        RSI().preferredColorScheme(.light)
//            .environment(\.editMode, Binding.constant(EditMode.active))
    }


}





//
//  ContentView.swift
//  Formu
//
//  Created by Daniel Ortiz on 6/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showWalkthrough = false
    //set to true when testing and comment out the on "OnAppear" mode
    

    @AppStorage("hasViewedWalkthrough") var hasViewedWalkthrough: Bool = false


    var formuTitle = ["Formulary", "Handtevy", "RSI"]
    
    var formuImages = ["💉", "🖐🏼", "🫁"]
    
    
    var navigationLinks = [AnyView(MedicationsList(medications: testData)), AnyView(handtevyView(ages: handtevyTestData)), AnyView(RSI())]
    
    
    
    var body: some View {
        

        NavigationView {


            ZStack {
                

                Color(hex: "073B4C")
                    .edgesIgnoringSafeArea(.all)



                List {

                    ForEach(formuTitle.indices, id: \.self) { index in

                        ZStack(alignment: .leading) {

                            NavigationLink(destination: navigationLinks[index]) {

                                EmptyView()
                            }
                            .opacity(0)

                            ExtractedView(imageName: formuImages[index], name: formuTitle[index])

                        }



                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color(hex: "073B4C"))
                    //blue color

                }

                .listStyle(.plain)
                .navigationTitle("formu")


    }


    }
        
        .sheet(isPresented: $showWalkthrough) {
            TutorialView()
        }
        .onAppear() {
            showWalkthrough = hasViewedWalkthrough ? false : true
        }
        .foregroundColor(.black)
        
}
        
        
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    
    var imageName: String
    var name: String
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 10) {
            
            
            HStack(alignment: .center, spacing: 20) {
                Text(imageName)
                    .padding()
                    .font(.system(size: 45, weight: .bold, design: .rounded))
                    .frame(height:165)
                    .cornerRadius(20)
                
                Text(name)
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .background(Color(hex: "06D6A0")).brightness(-0.15)
            //green
            .cornerRadius(15)
            .shadow(radius: 1.5)
            
            
            
        }
        .padding(.bottom)
        
        
    }
    
    
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

//IOS 16 CHANGES:
//With the new SwiftUI update in iOS 16 List no longer depends on UITableView. We need to update the UIcollectionReusableView background color.

extension UICollectionReusableView {
    override open var backgroundColor: UIColor? {
        get { .clear }
        set { }

        // default separators use same color as background
        // so to have it same but new (say red) it can be
        // used as below, otherwise we just need custom separators
        //
        // set { super.backgroundColor = .red }

    }
}

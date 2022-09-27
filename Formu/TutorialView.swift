//
//  TutorialView.swift
//  formuWatch
//
//  Created by Daniel Ortiz on 5/4/22.
//

import SwiftUI

struct TutorialView: View {
    
    var disclaimer = "This application was developed for medical reference only. The information must be verified prior to use by the provider. The author of this work takes no responsibility for the accuracy of the data presented. Any kind of liability claims from the use of this application will be rejected. If you do not agree, you must uninstall this applications immediately."
    
    @Environment(\.dismiss) var dismiss
    
    @AppStorage("hasViewedWalkthrough") var hasViewedWalkthrough: Bool = false
    
    @State private var currentPage = 0
    
    let pageHeadings = [ "DISCLAIMER", "CHOOSE YOUR MEDICATIONS", "HANDTEVY ON THE GO", "USEFUL RSI CHECKLIST" ]
    let pageSubHeadings = ["This application was developed for medical reference only. The information in this application must be verified and checked prior to use by the provider. The author of this work takes no responsability for the accuracy of the data presented. Any kind of liability claims from the use of this application will be rejected. If you do not agree, you must uninstall this application immediately.",
                            "View your medication of choice and its details",
                            "Use the handtevy method with its pre-selected medications",
                            "Follow a systematic approach  and check off items as you go"
                            ]
    let pageImages = [ "onboarding-4", "onboarding-1", "onboarding-2", "onboarding-3" ]
    
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemIndigo
        UIPageControl.appearance().pageIndicatorTintColor = .lightGray
    }
    
    var body: some View {
        
        ZStack {
            Color(hex: "073B4C")
                .edgesIgnoringSafeArea(.all)
        
        VStack {
            
            TabView(selection: $currentPage) {
                ForEach(pageHeadings.indices) { index in
                    TutorialPage(image: pageImages[index], heading: pageHeadings[index], subHeading: pageSubHeadings[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
            .animation(.default, value: currentPage)
            
            VStack(spacing: 20) {
                Button(action: {
                    if currentPage < pageHeadings.count - 1 {
                        currentPage += 1
                    } else {
                        hasViewedWalkthrough = true
                        dismiss()
                    }
                }) {
                    Text(currentPage == pageHeadings.count - 1 ? "GET STARTED" : "NEXT")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 50)
                        .background(Color(hex: "06D6A0")).brightness(-0.15)
                        .cornerRadius(25)
                }

                if currentPage < pageHeadings.count - 1 {
                    
                    Button(action: {
                        hasViewedWalkthrough = true
                        dismiss()
                    }) {
                        
                        Text("Skip")
                            .font(.headline)
                            .foregroundColor(Color(.white))
                        
                    }
                }
            }
            .padding(.bottom)

        }
        
    }
        
    }
}

struct TutorialPage: View {
    
    let image: String
    let heading: String
    let subHeading: String
    
    var body: some View {
        VStack(spacing: 70) {
            Image(image)
                .resizable()
                .scaledToFit()
            
            VStack(spacing: 10) {
                Text(heading)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(subHeading)
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.horizontal, 40)
            
            Spacer()
        }
        .padding(.top)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
        
        TutorialPage(image: "onboarding-1", heading: "CREATE YOUR OWN FOOD GUIDE", subHeading: "Pin your favorite restaurants and create your own food guide")
            .previewLayout(.sizeThatFits)
    }
}

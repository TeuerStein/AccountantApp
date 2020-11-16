//
//  FormulaDetail.swift
//  AccountantApp
//
//  Created by ALEXANDR DRAGUNOV on 11/7/20.
//

import SwiftUI
import AVKit

struct FormulaDetail: View {
    @State var result: String?
    
    var formula: Formula
    
    var body: some View {
        List {
            ZStack(alignment: .bottom) {
                // Title container code
                
                // Image for Title block
                Image(formula.picture)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                // Little blur for more readable title
                Rectangle()
                    .frame(height: 60)
                    .opacity(0.45)
                    .blur(radius: 10)
                    .foregroundColor(Color("HomePageButtons"))
                
                // Title for block & page
                HStack {
                    LazyVStack(alignment: .leading) {
                        Text(formula.name)
                            .font(.title)
                            .foregroundColor(Color("InvertColorsForPrimaryText"))
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    
                    Spacer()
                }
            }
            .shadow(radius: 5)
            .listRowInsets(EdgeInsets())
            
            LazyVStack(alignment: .leading, spacing: 15) {
                // Short info about
                
                HStack {
                    HStack(alignment: .top) {
                        Text("Type: ")
                            .font(.headline)
                        Spacer()
                    }
                    .frame(width: 150)
                    
                    Text(formula.type)
                        .font(.subheadline)
                }
                
                HStack(alignment: .top) {
                    HStack(alignment: .top) {
                        Text("Measurement in: ")
                            .font(.headline)
                        Spacer()
                    }
                    .frame(width: 150)
                    
                    Text(formula.measurementIn)
                        .font(.subheadline)
                }
            }
            .padding(.top)
            .padding(.bottom)
            
            LazyVStack(alignment: .center, spacing: 10) {
                // Description area
                
                // Title for block
                HStack(alignment: .top) {
                    Text("Description")
                        .font(.headline)
                }
                .frame(width: 150)
                
                // Description
                Text(formula.description)
            }
            .padding(.top)
            .padding(.bottom)
            
            LazyVStack(spacing: 30) {
                // Area for calculating
                
                
                // Title for block
                HStack(alignment: .center) {
                    Text("For calculate you need to write it down into text area")
                        .padding(15)
                        .multilineTextAlignment(.center)
                }
                
                // Fields generator
                calculatingFields(countOfFields: 7)
                
                Button("Calculate") { // Button for taking a variables into math functions --*beta*--
                    self.result = "here was be your result"
                }
                .frame(width: 120, height: 60)
                .cornerRadius(15)
                .background(Color("HomePageButtons"))
                .foregroundColor(Color("InvertColorsForPrimaryText"))
                .font(.headline)
                
                HStack {
                    // Result of calculating
                    
                    Text(result ?? "Let's calculate!") // There will be your result,
                                    // now I'll create simple text here
                }
            }
            .padding(.top, 10)
            .padding(.bottom)
            
            LazyVStack {
                // Video block
                
                // Title for block
                Text("Also you can watch the video about economics")
                    .padding(.bottom)
                    .multilineTextAlignment(.center)
                
                // Video player. I can't bring any videos from YouTube,
                // and because of it I take video from other sites in the internet
                VideoPlayer(player: AVPlayer(url: URL(string: "https://videos-fms.jwpsrv.com/0_5fb1424f_0x4ca193ff80192486b29e1483cb0d86234fd6d677/content/conversions/hmUZMORz/videos/WUUi5Lw4-3480264.mp4")!))
                    .frame(width: nil, height: 200)
            }
            .padding(.top)
            .padding(.bottom)
            
            LazyVStack(alignment: .center) {
                // Developer's block
                
                Text("Created by Oleksandr Sokolov")
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
        }
        .padding(.top, -50)
        .edgesIgnoringSafeArea(.all)
    }
}

struct calculatingFields: View {
    // Code with TextField ( and variables  for they ) & Text
    // for Calculating area
    
    @State var firstVariableForTextFields = ""
    @State var secondVariableForTextFields = ""
    @State var thirdVariableForTextFields = ""
    @State var fourVariableForTextFields = ""
    @State var fiveVariableForTextFields = ""
    @State var sixVariableForTextFields = ""
    @State var sevenVariableForTextFields = ""
    
    // Count of fields what is can be needed
    // for calculating by formula
    var countOfFields: Int
    
    var body: some View {
        
        // All fields for calculating
        let fields: Binding<String> = [
            self.firstVariableForTextFields,
            self.secondVariableForTextFields,
            self.thirdVariableForTextFields,
            self.fourVariableForTextFields,
            self.fiveVariableForTextFields,
            self.sixVariableForTextFields,
            self.sevenVariableForTextFields
        ]
        
        ForEach(0..<self.countOfFields) { field in
            // * BETA STATE OF *
            
            VStack(alignment: .leading) {
                Text("Text")
                    .padding(.leading, 10)
                
                TextField("Enter \(field) variable", text: (fields[field]))
                    .padding(10)
                    .background(Color("HomePageButtons").opacity(0.85))
                    .clipShape(Capsule())
            }
        }
    }
}

struct FormulaDetail_Previews: PreviewProvider {
    static var previews: some View {
        FormulaDetail(formula: formulaData[0])
    }
}

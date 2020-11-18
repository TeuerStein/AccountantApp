//
//  FormulaDetail.swift
//  AccountantApp
//
//  Created by ALEXANDR DRAGUNOV on 11/7/20.
//

import SwiftUI
import AVKit

struct FormulaDetail: View {
    
    // Variable for result of calculating
    @State var result: String?
    
    // Variable for object
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
            .listRowInsets(EdgeInsets())
            .padding(.bottom)
            
            LazyVStack(alignment: .leading, spacing: 15) {
                // Short info about
                
                HStack {
                    HStack(alignment: .top) {
                        Text("Type: ")
                            .font(.headline)
                            .foregroundColor(Color("InvertColorsForPrimaryText"))
                        Spacer()
                    }
                    .frame(width: 150)
                    
                    Text(formula.type)
                        .font(.subheadline)
                        .foregroundColor(Color("InvertColorsForSecondaryText"))
                }
                
                HStack(alignment: .top) {
                    HStack(alignment: .top) {
                        Text("Measurement in: ")
                            .font(.headline)
                            .foregroundColor(Color("InvertColorsForPrimaryText"))
                        Spacer()
                    }
                    .frame(width: 150)
                    
                    Text(formula.measurementIn)
                        .font(.subheadline)
                        .foregroundColor(Color("InvertColorsForSecondaryText"))
                }
            }
            .padding()
            .background(Color("HomePageButtons"))
            .cornerRadius(10)
            .shadow(radius: 4)
            
            LazyVStack(alignment: .center, spacing: 10) {
                // Description area
                
                // Title for block
                HStack(alignment: .top) {
                    Text("Description")
                        .font(.headline)
                        .foregroundColor(Color("InvertColorsForPrimaryText"))
                }
                .frame(width: 150)
                
                // Description
                Text(formula.description)
                    .foregroundColor(Color("InvertColorsForSecondaryText"))
            }
            .padding()
            .background(Color("HomePageButtons"))
            .cornerRadius(10)
            .shadow(radius: 4)
            
            LazyVStack(spacing: 30) {
                // Area for calculating
                
                
                // Title for block
                HStack(alignment: .center) {
                    Text("For calculate you need to write it down into text area")
                        .padding(15)
                        .multilineTextAlignment(.center)
                }
                
                // Fields generator
                CalculatingFields(countOfFields: 6)
                
                Button("Calculate") { // Button for taking a variables into math functions --*beta*--
                    self.result = "here was be your result"
                }
                .frame(width: 120, height: 60)
                .cornerRadius(15)
                .background(Color("InvertColorsForPrimaryText"))
                .foregroundColor(Color("HomePageButtons"))
                .cornerRadius(10)
                .shadow(radius: 4)
                .font(.headline)
                
                HStack {
                    // Result of calculating
                    
                    Text(result ?? "Let's calculate!") // There will be your result,
                        .foregroundColor(Color("InvertColorsForPrimaryText")) // now I'll create simple text here
                }
            }
            .padding(.top, 10)
            .padding(.bottom)
            
            LazyVStack {
                // Video block
                
                // Title for block
                HStack {
                    Text("Also you can watch the video about economics")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("InvertColorsForPrimaryText"))
                }
                .padding(.top, 10)
                .padding(.trailing, 10)
                .padding(.bottom, 10)
                .padding(.leading, 10)
                .background(Color("HomePageButtons"))
                .cornerRadius(10)
                .shadow(radius: 4)
                
                // Video player. I can't bring any videos from YouTube,
                // and because of it I take video from other sites in the internet
                VideoPlayer(player: AVPlayer(url: URL(string: "https://content.jwplatform.com/manifests/FYyScuyE.m3u8")!))
                    .frame(width: nil, height: 200)
            }
            
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

struct CalculatingFields: View {
    // Code with TextField ( and variables  for they ) & Text
    // for Calculating area
    
    // All of fields what we'll be using
    @State var firstVariableForTextFields: String = ""
    @State var secondVariableForTextFields: String = ""
    @State var thirdVariableForTextFields: String = ""
    @State var fourVariableForTextFields: String = ""
    @State var fiveVariableForTextFields: String = ""
    @State var sixVariableForTextFields: String = ""
    @State var sevenVariableForTextFields: String = ""
    
    // Count of fields what is can be needed
    // for calculating by formula
    var countOfFields: Int
    
    var body: some View {
        
        // All fields for calculating.
        // Array for fields
        var fields: [Binding<String>] = [
            self.$firstVariableForTextFields,
            self.$secondVariableForTextFields,
            self.$thirdVariableForTextFields,
            self.$fourVariableForTextFields,
            self.$fiveVariableForTextFields,
            self.$sixVariableForTextFields,
            self.$sevenVariableForTextFields
        ]
        
        
        // Generating fields for object
        ForEach(0..<self.countOfFields) { field in
            // * BETA STATE OF *
            
            VStack(alignment: .leading) {
                
                // Text for title
                Text("Text for test")
                    .padding(.leading, 10)
                
                
                // One of fields from fields array
                TextField("Enter \(field + 1) variable", text: fields[field])
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

//
//  FormulaDetail.swift
//  AccountantApp
//
//  Created by ALEXANDR DRAGUNOV on 11/7/20.
//

import SwiftUI

struct FormulaDetail: View {
    @State var firstvariableForTextFields = ""
    @State var secondvariableForTextFields = ""
    @State var thirdvariableForTextFields = ""
    @State var result = ""
    var formula: Formula
    
    var body: some View {
        List {
            ZStack(alignment: .bottom) {
                // Title container code
                
                Image(formula.picture)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                Rectangle()
                    .frame(height: 60)
                    .opacity(0.45)
                    .blur(radius: 10)
                    .foregroundColor(Color("HomePageButtons"))
                
                
                HStack {
                    VStack(alignment: .leading) {
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
            
            VStack(alignment: .leading, spacing: 15) {
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
            
            VStack(alignment: .center, spacing: 10) {
                // Description area
                
                HStack(alignment: .top) {
                    Text("Description")
                        .font(.headline)
                }
                .frame(width: 150)
                
                Text(formula.description)
            }
            .padding(.top)
            .padding(.bottom, 10)
            
            VStack(spacing: 30) {
                // Area for calculating
                
                HStack(alignment: .center) {
                    Text("For calculate you need write it down into text area")
                        .padding(15)
                }
                
                // Three TextFields for entering some variables
                
                TextField("Enter first variable", text: $firstvariableForTextFields)
                    .padding(10)
                    .background(Color("HomePageButtons").opacity(0.85))
                    .clipShape(Capsule())
                
                TextField("Enter first variable", text: $secondvariableForTextFields)
                    .padding(10)
                    .background(Color("HomePageButtons").opacity(0.85))
                    .clipShape(Capsule())
                
                TextField("Enter first variable", text: $thirdvariableForTextFields)
                    .padding(10)
                    .background(Color("HomePageButtons").opacity(0.85))
                    .clipShape(Capsule())
                
                Button("Calculate") { // Button for taking a variables into math functions *beta*
                    self.result = "here was be your result"
                }
                
                HStack {
                    // Result of calculating
                    
                    Text(result) // There will be your result,
                                    // now I'll create simple text here
                }
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
            
            /* BETA CODE */
            
            HStack {
                Text("Some text for next block") // It's test filed,
                                                    // don't care about it
            }
        }
        .padding(.top, -50)
        .edgesIgnoringSafeArea(.all)
    }
}

struct FormulaDetail_Previews: PreviewProvider {
    static var previews: some View {
        FormulaDetail(formula: formulaData[0])
    }
}

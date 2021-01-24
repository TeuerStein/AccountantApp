//
//  FieldsAndTexts.swift
//  AccountantApp
//
//  Created by OLEKSANDR SOKOLOV on 1/24/21.
//

import SwiftUI

struct CalculatingFields: View {
    // Code with TextField ( and variables  for they ) & Text
    // for Calculating area
    
    // Initialized a mass of fields for calculating area
    // * We need to create fields inside this mass
    // for getting more readable code *
    @State var massOfField: [Binding<String>]? // * BETA STATE OF *
    
    // Count of fields what is can be needed
    // for calculating by formula
    var countOfFields: Int
    
    // New variable for using a 'formula' object
    var formulaDetailStructure: Formula
    
    var body: some View {
        
        // Generating fields for object
        ForEach(0..<self.countOfFields) { field in
            VStack(alignment: .leading) {
                
                // One of fields from fields array
                TextField("\(TextForFields(formulaObject: self.formulaDetailStructure, coutForEach: field).themeOfFormula())", text: self.massOfField![field])
                    .frame(width: 250)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .clipShape(Capsule())
                    .shadow(color: Color("InvertColorsForPrimaryText"), radius: 10)
            }
        }
        
        Button("Calculate") { // Button for taking a variables into math functions --*beta*--
            
        }
        .frame(width: 120, height: 60)
        .cornerRadius(15)
        .background(Color("InvertColorsForPrimaryText"))
        .foregroundColor(Color("HomePageButtons"))
        .cornerRadius(10)
        .shadow(radius: 4)
        .font(.headline)
    }
}

struct TextForFields {
    
    // Const with object
    let formulaObject: Formula
    
    // Counts of numbers from ForEach for themeOfFormula function
    var coutForEach: Int
    
    // Function for adding the names for fields
    func themeOfFormula() -> String {
        // * BETA STATE OF *
        
        // Checking the name of current object
        // and view names of fields
        if formulaObject.name == "Gross domestic product" {
            let textResultForFields = [
                "Private consumption",
                "Gross investment",
                "Government investment",
                "Government spending",
                "Exports",
                "Imports"
            ]
            return textResultForFields[self.coutForEach]
        } else if formulaObject.name == "Annual percentage rate" {
            let textResultForFields = [
                "Loan Amount",
                "Interest Rate (%)",
                "Length of Loan/Months",
                "Cost"
            ]
            return textResultForFields[self.coutForEach]
        } else if formulaObject.name == "Compound interest"{
            let textResultForFields = [
                "Interest",
                "Compound"
            ]
            return textResultForFields[self.coutForEach]
        } else if formulaObject.name == "Effective interest rate" {
            let textResultForFields = [
                "nominal rate",
                "number of compounding periods",
            ]
            return textResultForFields[self.coutForEach]
        } else {
            return ""
        }
    }
}

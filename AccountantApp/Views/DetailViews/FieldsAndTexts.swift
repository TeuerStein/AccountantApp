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
    
    var formulaId: Int
    
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
        
        var massOfFields = [
            self.$firstVariableForTextFields,
            self.$secondVariableForTextFields,
            self.$thirdVariableForTextFields,
            self.$fourVariableForTextFields,
            self.$fiveVariableForTextFields,
            self.$sixVariableForTextFields,
            self.$sevenVariableForTextFields
        ]
        
        ForEach(0..<countOfFields) { field in
            VStack(alignment: .leading) {
                Text("Text")
                    .padding(.leading, 10)
                
                TextField("Enter \(field + 1) variable", text: massOfFields[field])
                    .padding(10)
                    .background(Color("HomePageButtons").opacity(0.85))
                    .clipShape(Capsule())
            }
        }
        
        Button("Result") { // calculation button
            
        }
        
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

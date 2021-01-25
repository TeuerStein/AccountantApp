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
    
    @State var formulaObject: Formula
    
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
        
        let massOfFields = [
            self.$firstVariableForTextFields,
            self.$secondVariableForTextFields,
            self.$thirdVariableForTextFields,
            self.$fourVariableForTextFields,
            self.$fiveVariableForTextFields,
            self.$sixVariableForTextFields,
            self.$sevenVariableForTextFields
        ]
        
        let textForFields = TextForFields(formulaObject: self.formulaObject)
        
        ForEach(0..<countOfFields) { field in
            VStack(alignment: .leading) {
                Text("\(textForFields.textResultForFields[field])")
                    .padding(.leading, 10)
                
                TextField("Enter \(field + 1) variable", text: massOfFields[field])
                    .padding(10)
                    .background(Color("HomePageButtons").opacity(0.85))
                    .clipShape(Capsule())
            }
        }
        
        Button("Result") { // calculation button
            
        }
        .font(.headline)
        
    }
    
}

struct TextForFields {
    
    // Const with object
    let formulaObject: Formula
    
    var textResultForFields: [String] {
        get {
            // Checking the name of current object
            // and view names of fields
            if formulaObject.name == "Gross domestic product" {
                let newValue = [
                    "Private consumption",
                    "Gross investment",
                    "Government investment",
                    "Government spending",
                    "Exports",
                    "Imports"
                ]
                return newValue
            } else if formulaObject.name == "Annual percentage rate" {
                let newValue = [
                    "Loan Amount",
                    "Interest Rate (%)",
                    "Length of Loan/Months",
                    "Cost"
                ]
                return newValue
            } else if formulaObject.name == "Compound interest"{
                let newValue = [
                    "Interest",
                    "Compound"
                ]
                return newValue
            } else if formulaObject.name == "Effective interest rate" {
                let newValue = [
                    "nominal rate",
                    "number of compounding periods",
                ]
                return newValue
            }
            
            return [""]
        }
        
        set {
            // Checking the name of current object
            // and view names of fields
            if formulaObject.name == "Gross domestic product" {
                textResultForFields = [
                    "Private consumption",
                    "Gross investment",
                    "Government investment",
                    "Government spending",
                    "Exports",
                    "Imports"
                ]
            } else if formulaObject.name == "Annual percentage rate" {
                textResultForFields = [
                    "Loan Amount",
                    "Interest Rate (%)",
                    "Length of Loan/Months",
                    "Cost"
                ]
            } else if formulaObject.name == "Compound interest"{
                textResultForFields = [
                    "Interest",
                    "Compound"
                ]
            } else if formulaObject.name == "Effective interest rate" {
                textResultForFields = [
                    "nominal rate",
                    "number of compounding periods",
                ]
            } else {
                textResultForFields = []
            }
        }
    }
    
    
    
    
}

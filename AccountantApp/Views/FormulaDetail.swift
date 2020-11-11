//
//  FormulaDetail.swift
//  AccountantApp
//
//  Created by ALEXANDR DRAGUNOV on 11/7/20.
//

import SwiftUI

struct FormulaDetail: View {
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
            
            VStack(alignment: .leading) {
                // Short info about
                
                HStack {
                    Text("Type: ")
                        .font(.headline)
                    
                    Spacer()
                    Text(formula.type)
                        .font(.subheadline)
                    Spacer()
                }
                
                Spacer()
                
                HStack(alignment: .top) {
                    Text("Measurement in: ")
                        .font(.headline)
                    
                    Spacer()
                    Text(formula.measurementIn)
                        .font(.subheadline)
                    Spacer()
                }
            }
            .padding(.top)
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

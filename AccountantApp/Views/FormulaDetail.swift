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
                HStack(alignment: .top) {
                    Text("Description")
                        .font(.headline)
                }
                .frame(width: 150)
                
                Text(formula.description)
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

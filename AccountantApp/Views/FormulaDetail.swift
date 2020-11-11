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
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct FormulaDetail_Previews: PreviewProvider {
    static var previews: some View {
        FormulaDetail(formula: formulaData[0])
    }
}

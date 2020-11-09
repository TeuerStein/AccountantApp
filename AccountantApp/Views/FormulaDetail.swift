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
            ZStack {
                Color.blue
                Text(formula.name)
                    .font(.title)
            }
            .shadow(radius: 5)
            .frame(height: 120)
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

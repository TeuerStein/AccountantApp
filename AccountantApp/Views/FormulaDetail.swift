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
            HStack(alignment: .top) {
                Text(formula.name)
                    .font(.title)
            }
            .padding(10)
            .frame(width: 375, height: 150)
            .background(Color.green.opacity(0.85))
            .shadow(radius: 5)
            .listRowInsets(EdgeInsets())
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct FormulaDetail_Previews: PreviewProvider {
    static var previews: some View {
        FormulaDetail(formula: formulaData[0])
    }
}

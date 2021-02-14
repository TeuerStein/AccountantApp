//
//  FormulaItem.swift
//  AccountantApp
//
//  Created by ALEXANDR DRAGUNOV on 11/6/20.
//

import SwiftUI

struct FormulaStack: View {
    var objects: [Formula]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                GenerateItems(objects: objects, geometry: geometry)
            }
        }
    }
}

struct FormulaStack_Previews: PreviewProvider {
    static var previews: some View {
        FormulaStack(objects: formulaData)
    }
}

struct GenerateItems: View {
    var objects: [Formula]
    var geometry: GeometryProxy
    
    var body: some View {
        VStack(alignment: .center, spacing: 35) {
            ForEach(self.objects, id: \.name) { object in
                NavigationLink( destination: FormulaDetail(formula: object)) {
                    FormulaItem(object: object)
                        .frame(width: abs(geometry.size.width - 20), height: abs(geometry.size.height / 1.8))
                }
                
                Divider()
                    .padding(.top, 50)
            }
        }
    }
}

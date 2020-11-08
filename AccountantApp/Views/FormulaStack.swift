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
        HStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    ForEach(self.objects, id: \.name) { object in
                        NavigationLink( destination: FormulaDetail(formula: object)) {
                            FormulaItem(object: object)
                        }
                    }
                    .padding(.bottom, 30)
                }
            }
        }
    }
}

struct FormulaStack_Previews: PreviewProvider {
    static var previews: some View {
        FormulaStack(objects: formulaData)
    }
}

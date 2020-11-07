//
//  FormulaItem.swift
//  AccountantApp
//
//  Created by ALEXANDR DRAGUNOV on 11/6/20.
//

import SwiftUI

struct FormulaItem: View {
    var object: Formula

    var body: some View {
        VStack(alignment: .center, spacing: 10.0) {
            Text(object.name)
                .foregroundColor(.primary)
                .font(.headline)
            
            Text(object.description)
                .foregroundColor(.secondary)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .lineLimit(4)
        }
        .padding(10)
        .frame(height: 150)
        .background(Color.orange.opacity(0.85))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct FormulaItem_Previews: PreviewProvider {
    static var previews: some View {
        FormulaItem(object: formulaData[0])
    }
}

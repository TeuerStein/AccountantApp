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
        GeometryReader { geometry in
            LazyVStack(alignment: .center, spacing: 10.0) {
                Image(object.picture)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: 190)
                    .padding(.top, -15)
                
                Text(object.name)
                    .foregroundColor(Color("InvertColorsForPrimaryText"))
                    .font(.headline)
                
                Text(object.description)
                    .foregroundColor(Color("InvertColorsForSecondaryText"))
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(4)
                    .padding(.horizontal, 10)
            }
            .frame(width: .infinity, height: 330)
            .background(Color("HomePageButtons").opacity(0.85))
            .cornerRadius(10)
            .shadow(radius: 5)
        }
    }
}

struct FormulaItem_Previews: PreviewProvider {
    static var previews: some View {
        FormulaItem(object: formulaData[1])
    }
}

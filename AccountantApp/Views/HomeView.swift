//
//  ContentView.swift
//  AccountantApp
//
//  Created by ALEXANDR DRAGUNOV on 11/6/20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                FormulaStack(objects: formulaData)
                    .navigationBarTitle("Accountant Calc")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

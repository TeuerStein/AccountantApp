//
//  Formula.swift
//  AccountantApp
//
//  Created by ALEXANDR DRAGUNOV on 11/6/20.
//

import SwiftUI

struct Formula: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var type: String
    var measurementIn: String
    var picture: String
}

extension Formula {
    func grossDomesticProduct() {
        return
    }
}

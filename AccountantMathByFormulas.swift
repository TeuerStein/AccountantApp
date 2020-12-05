//
//  AccountantMathByFormulas.swift
//  AccountantApp
//
//  Created by OLEKSANDR SOKOLOV on 12/5/20.
//

import Foundation

struct AccountantMathByFormulas {
    func grossDomesticProduct(
        privateConsumption: Double,
        grossInvestment: Double,
        governmentInvestment: Double,
        governmentSpending: Double,
        exports: Double,
        imports: Double
    ) -> Double {
        // function for calculating a Gross Domastic Product
        
        let result = privateConsumption + grossInvestment + governmentInvestment + governmentSpending + (exports - imports)
        return result
    }
}

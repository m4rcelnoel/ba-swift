//
//  Model.swift
//  ba-swift
//
//  Created by Marcel Gruber on 23.01.23.
//

import Foundation

struct DrinkEntry: Codable {
    let id: Int
    let name: String
    let description: String
    let measure: String
    let price: String
}

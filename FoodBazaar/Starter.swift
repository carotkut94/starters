//
//  Starter.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import Foundation

struct Starter: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}


struct StarterResponse : Decodable {
    let request: [Starter]
}

struct MockData {
    static let sampleStarter = Starter(id: 1, name: "Test", description: " Yummy Yummy Yummy Yummy Yummy Yummy Yummy Yummy Yummy Yummy Yummy Yummy Yummy Yummy", price: 9.99, imageURL: "", calories: 9, protein: 10, carbs: 10)
    
    static let starters = [sampleStarter, sampleStarter, sampleStarter, sampleStarter]
}

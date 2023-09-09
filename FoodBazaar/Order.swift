//
//  Order.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Starter] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price}
    }
    
    func add(_ item: Starter){
        items.append(item)
    }
    
    func remove(atOffsets: IndexSet){
        items.remove(atOffsets: atOffsets)
    }
    
}

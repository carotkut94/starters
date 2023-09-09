//
//  FoodBazaarApp.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import SwiftUI

@main
struct FoodBazaarApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            FoodBazaarTabView()
                .environmentObject(order)
        }
    }
}

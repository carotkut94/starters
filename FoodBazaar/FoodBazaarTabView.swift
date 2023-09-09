//
//  ContentView.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import SwiftUI

struct FoodBazaarTabView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        TabView {
            FoodListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(order.items.count)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodBazaarTabView()
    }
}

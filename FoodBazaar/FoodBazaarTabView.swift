//
//  ContentView.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import SwiftUI

struct FoodBazaarTabView: View {
    var body: some View {
        TabView {
            FoodListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(Color.brandPriamry)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodBazaarTabView()
    }
}

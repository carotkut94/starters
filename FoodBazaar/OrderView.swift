//
//  OrderView.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items){ orderItem in
                            StarterListCell(starter: orderItem)
                                .listRowSeparator(.hidden)
                        }
                        .onDelete(perform: { indexSet in
                            deleteItems(at: indexSet)
                        })
                    }
                    .listStyle(.plain)
                    
                    Button {
                        
                    }label: {
                        FBButton(title: "$\(order.totalPrice, specifier: "%.2f") Place Order")
                    }.padding(.bottom, 25)
                }
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "No Orders to Place")
                }
            }.navigationTitle("Orders")
        }
    }
    
    func deleteItems(at offset:IndexSet){
        order.remove(atOffsets: offset)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

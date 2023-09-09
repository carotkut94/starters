//
//  OrderView.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import SwiftUI

struct OrderView: View {
    
    @State var orderItems = MockData.orders
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orderItems){ orderItem in
                            StarterListCell(starter: orderItem)
                        }
                        .onDelete(perform: { indexSet in
                            deleteItems(at: indexSet)
                        })
                    }
                    .listStyle(.plain)
                    
                    Button {
                        
                    }label: {
                        FBButton(title: "$9.99 Place Order")
                    }.padding(.bottom, 25)
                }
                if orderItems.isEmpty {
                    EmptyState(imageName: "empty-order", message: "No Orders to Place")
                }
            }.navigationTitle("Orders")
        }
    }
    
    func deleteItems(at offset:IndexSet){
        orderItems.remove(atOffsets: offset)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

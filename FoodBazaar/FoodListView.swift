//
//  FoodListView.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import SwiftUI

struct FoodListView: View {
    
    @StateObject private var foodListViewModel = FoodListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedStarter: Starter?
    
    var body: some View {
        ZStack{
            NavigationView {
                List(foodListViewModel.starters, id: \.id){ starter in
                    StarterListCell(starter: starter)
                        .onTapGesture {
                            isShowingDetail = true
                            selectedStarter = starter
                        }
                }
                .navigationTitle("🍟 Starters")
                .disabled(isShowingDetail)
            }.onAppear {
                foodListViewModel.fetchStartersList()
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            
            
            
            if isShowingDetail {
                StarterListDetailView(isShowingDetail: $isShowingDetail, starter: selectedStarter!)
            }
            
            if foodListViewModel.isLoading {
                LoadingView()
            }
        }.alert(item: $foodListViewModel.alertItem){ alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView()
    }
}

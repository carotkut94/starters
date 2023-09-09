//
//  FoodListView.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import SwiftUI

struct FoodListView: View {
    
    @StateObject private var foodListViewModel = FoodListViewModel()
    
    var body: some View {
        ZStack{
            NavigationView {
                List(foodListViewModel.starters, id: \.id){ starter in
                    StarterListCell(starter: starter)
                        .onTapGesture {
                            foodListViewModel.isShowingDetail = true
                            foodListViewModel.selectedStarter = starter
                        }
                }
                .navigationTitle("🍟 Starters")
                .listStyle(.plain)
                .disabled(foodListViewModel.isShowingDetail)
            }.onAppear {
                foodListViewModel.fetchStartersList()
            }
            .blur(radius: foodListViewModel.isShowingDetail ? 20 : 0)
            
            if foodListViewModel.isShowingDetail {
                StarterListDetailView(isShowingDetail: $foodListViewModel.isShowingDetail, starter: foodListViewModel.selectedStarter!)
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

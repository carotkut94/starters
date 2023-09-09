//
//  FoodListViewModel.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import UIKit
import SwiftUI

@MainActor
final class FoodListViewModel : ObservableObject {
    @Published var starters: [Starter] = []
    @Published var alertItem: AlertItem?
    
    @Published var isLoading = false

    @Published var isShowingDetail = false
    @Published var selectedStarter: Starter?
    
//    func fetchStartersList(){
//        isLoading = true
//
//        NetworkManager.shared.getStarters() { result in
//            DispatchQueue.main.async {
//                self.isLoading = false
//                switch result {
//                case .success(let starters):
//                    self.starters = starters
//                case .failure(let error):
//                    switch error {
//                    case .invalidData:
//                        self.alertItem = AlertContext.invalidData
//                    case .invalidUrl:
//                        self.alertItem = AlertContext.invalidURL
//                    case .invalidResponse:
//                        self.alertItem = AlertContext.invalidResponse
//                    case .unableToComplete:
//                        self.alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    
    func fetchStartersList(){
        isLoading = true
        Task {
            do {
                self.starters = try await NetworkManager.shared.getStarters()
                isLoading = false
            }catch {
                isLoading = false
                if let fbError = error as? FBError {
                    switch fbError {
                        case .invalidData:
                            self.alertItem = AlertContext.invalidData
                        case .invalidUrl:
                            self.alertItem = AlertContext.invalidURL
                        case .invalidResponse:
                            self.alertItem = AlertContext.invalidResponse
                        case .unableToComplete:
                            self.alertItem = AlertContext.unableToComplete
                                            
                    }
                } else {
                    self.alertItem = AlertContext.invalidResponse
                }
            }
        }
    }
}

//
//  AccountViewModel.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import SwiftUI

class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem? 
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else  {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges(){
        guard isValidForm else {return}
        
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.saveSuccess
        }catch{
            alertItem = AlertContext.saveError
        }
        
        print("Changes saved")
    }
    
    func fetchUser(){
        guard let userData = userData else {return}
        
        do{
            let data = try JSONDecoder().decode(User.self, from: userData)
            self.user = data
        }catch{
            alertItem = AlertContext.invalidUserData
        }
        
    }
}

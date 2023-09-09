//
//  Alert.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct AlertContext {
    
    // MARK: Network errors
    static let invalidData = AlertItem(title: Text("Server Error"),
                                              message: Text("Data received from server was invalid, contact support"),
                                              dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                              message: Text("Invalid received from server was invalid, contact support"),
                                              dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("URL Error"),
                                              message: Text("The given server url is incorrect, contact support"),
                                              dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                              message: Text("Unable to complete your request this time"),
                                              dismissButton: .default(Text("OK")))
    
    
    // MARK: Form errors
    static let invalidForm = AlertItem(title: Text("Invalid form"),
                                              message: Text("Make sure all forms fields are filled"),
                                              dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid form"),
                                              message: Text("Make sure email address is valid"),
                                              dismissButton: .default(Text("OK")))
    
    static let saveError = AlertItem(title: Text("Profile Error"),
                                              message: Text("Failed to save user info"),
                                              dismissButton: .default(Text("OK")))
    
    static let saveSuccess = AlertItem(title: Text("Profile Success"),
                                              message: Text("User info saved"),
                                              dismissButton: .default(Text("OK")))
    
    static let invalidUserData = AlertItem(title: Text("Profile Error"),
                                              message: Text("User info not found"),
                                              dismissButton: .default(Text("OK")))
}


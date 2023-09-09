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
}


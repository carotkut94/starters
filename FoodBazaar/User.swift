//
//  User.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import Foundation


struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefills = false
}

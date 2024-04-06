//
//  ProfileModel.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-04-06.
//

import Foundation

struct ProfileModel:  Identifiable {
    var id: String
    let username: String
    let email: String
    let password : String
    let phoneNumber: Int
    let Gender: String
    let DateOfBirth: Date
    let shippingAddress: String
    // Add other properties as needed
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username
        case email
        case phoneNumber
        case password
        case Gender
        case DateOfBirth
        case shippingAddress
        
    }
}

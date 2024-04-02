//
//  Product detail.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-30.
//

import Foundation

struct ProductModel: Codable, Identifiable {
    var id: String
    let productName: String
    let category: String
    let description : String
    let price: Double
    let image: String
    // Add other properties as needed
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case productName
        case category
        case price
        case description
        case image = "imageUrl"
    }
}




struct APIConstants {
    static let getallURL = "https://api-4f0q.onrender.com/products/get"
    static let getidURL = "https://api-4f0q.onrender.com/getid/"
}

//
//  CartModel.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-04-03.
//

import Foundation
struct CartModel: Codable {
    let product: String // Assuming this is the product ID
       let quantity: Int
    let price: Double
       
    enum CodingKeys: String, CodingKey {
        case product = "productId"
        case quantity
        case price
        
    }
}




struct APIConstantsCart {
    static let getallURL = "https://api-4f0q.onrender.com/cart/get"
    static let postURL = "https://api-4f0q.onrender.com/cart"
    
}

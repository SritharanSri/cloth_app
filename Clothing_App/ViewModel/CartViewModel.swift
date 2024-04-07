//
//  CartViewModel.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-04-03.
//

import Foundation
class CartViewModel: ObservableObject {
    @Published var cartItems: [CartModel] = []
    
    
    func loadCartItemsFromLocalStorage() {
           if let savedCartData = UserDefaults.standard.data(forKey: "cartItems") {
               let decoder = JSONDecoder()
               if let loadedCartItems = try? decoder.decode([CartModel].self, from: savedCartData) {
                   cartItems = loadedCartItems
                   print(cartItems)
               }
           }
       }
    func saveCartItem(_ cartItem: CartModel) {
           cartItems.append(cartItem)
           
       }
   /* func getAllCartItems() {
        guard let url = URL(string: APIConstantsCart.getallURL) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let cartItems = try JSONDecoder().decode([CartModel].self, from: data)
                    DispatchQueue.main.async {
                        self.cartItems = cartItems
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }*/
    
    func saveCartItemsToLocalStorage() {
          let encoder = JSONEncoder()
          if let encoded = try? encoder.encode(cartItems) {
              UserDefaults.standard.set(encoded, forKey: "cartItems")
          }
      }
    
  /*  func saveCartItemToPhoneStorage(_ cartItem: CartModel) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(cartItem)
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let cartItemURL = documentsDirectory.appendingPathComponent("cartItem.json")
            try data.write(to: cartItemURL)
        
   
   } catch {
            print("Error saving cart item: \(error)")
        }
    }*/
   
   /* func saveCartItem(_ cartItem: CartModel) {
        guard let url = URL(string: APIConstantsCart.postURL) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(cartItem)
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error saving cart item: \(error)")
                    return
                }
                
                if let data = data {
                    // Process the response from the server if needed
                    print("Cart item saved successfully")
                }
            }.resume()
        } catch {
            print("Error encoding cart item: \(error)")
        }
    }*/


    
  

}

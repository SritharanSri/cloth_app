//
//  ClothView.swift
//  Clothing_App
//
//  Created by NIBM on 2024-03-23.
//

import SwiftUI
import URLImage

struct ClothView: View {
    let productID: String
    @ObservedObject var viewModel = ProductViewModel()
    @StateObject var cartViewModel = CartViewModel()
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Product Details")
                .font(.title2)
            
            if let product = viewModel.products.first(where: { $0.id == productID }) {
                URLImage(URL(string: product.image)!) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                }
                
                VStack(spacing: 4) {
                    HStack(spacing: 100) {
                        Text(product.productName)
                            .font(.system(size: 20))
                        Text("$\(product.price, specifier: "%.2f")")
                            .font(.system(size: 20))
                    }
                    Text("Category - \(product.category)")
                        .font(.system(size: 15))
                        .bold()
                        .offset(x: -120, y: 10)
                    Text("Description")
                        .font(.subheadline)
                        .offset(x: -130, y: 20)
                    Text(product.description)
                        .font(.body)
                        .offset(y: 20)
                        .padding(.leading, 7)
                        .padding(.trailing, -5)
                    Spacer()
                }
                .padding()
                
                HStack {
                    Button(action:{
                        
                            if let product = viewModel.products.first(where: { $0.id == productID }) {
                                let cartItem = CartModel(product: product.productName, quantity: 1, price: product.price, image: product.image)
                                cartViewModel.saveCartItem(cartItem) // Add cart item to the cart
                                cartViewModel.saveCartItemsToLocalStorage() // Save cart items to local storage
                                showAlert = true
                            }
                    }) {
                        Text("Add to Cart")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 180, height: 50)
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Added to Cart"), message: Text("This item has been added to your cart."), dismissButton: .default(Text("OK")))
                    }
                    
                    NavigationLink(destination: PaymentView(total:product.price)) {
                        Text("Buy")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 180, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .offset(y: 10)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.fetchProductDetails(for: productID)
        }
    }
}

struct ClothContentView: View {
    var body: some View {
        ClothView( productID: "")
    }
}








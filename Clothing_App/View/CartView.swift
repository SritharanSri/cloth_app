//
//  CartView.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-26.
//


import SwiftUI
import URLImage


struct CartView: View {
    @ObservedObject var cartViewModel = CartViewModel()
    @State private var itemCount = 1
    @State private var itemCount01 = 1
    
    var body: some View {
        VStack {
            Text("Cart Details")
                .font(.title2)
                .padding()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(cartViewModel.cartItems) { cartItem in
                        CartItemRow(cartItem: cartItem)
                    }
                }
                .padding()
            }
            
            
            VStack {
                
                Text("Order Information")
                    .font(.title2)
                    .padding()
                
                HStack {
                    Text("SubTotal")
                    Spacer()
                    Text("$\(calculateSubtotal(), specifier: "%.2f")")
                }
                .padding()
                
                HStack {
                    Text("Shipping")
                    Spacer()
                    Text("$20")
                }
                .padding()
                
                HStack {
                    Text("Total")
                    Spacer()
                    Text("$\(calculateTotal(), specifier: "%.2f")")
                        .font(.title)
                }
                .padding()
            }
            
            Spacer()
            
            NavigationLink(destination: PaymentView(total:calculateTotal()) ) {
                Text("Check Out")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 180, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
        .onAppear {
            
            cartViewModel.loadCartItemsFromLocalStorage()
                      
        }
    }
    
    func calculateSubtotal() -> Double {
        var subtotal = 0.0
        for cartItem in cartViewModel.cartItems {
            subtotal += cartItem.price * Double(cartItem.quantity)
        }
        return subtotal
    }
    
    func calculateTotal() -> Double {
        return calculateSubtotal() + 20
    }
}

struct CartItemRow: View {
    let cartItem: CartModel
    
    var body: some View {
        VStack {
            
            URLImage(URL(string: cartItem.image)!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                    .cornerRadius(10)
            }
            Text(cartItem.product)
            Text("Quantity: \(cartItem.quantity)")
            Text("Price: $\(cartItem.price, specifier: "%.2f")")
        }
        .padding()
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(10)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}


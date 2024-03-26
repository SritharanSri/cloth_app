//
//  ClothView.swift
//  Clothing_App
//
//  Created by NIBM on 2024-03-23.
//

import SwiftUI
// Add custom colors for better visuals
import SwiftUI

// Sample data
let products: [ProductDetails] = [
    ProductDetails(name: "Product 1", description: "Description", price: 49.99, imageName: "product1", category: ""),
    ProductDetails(name: "Product 2", description: "Description", price: 59.99, imageName: "product2", category: ""),
    ProductDetails(name: "Product 3", description: "Description", price: 69.99, imageName: "product3", category: ""),
]

let relatedProducts: [ProductDetails] = [
    ProductDetails(name: "Related Product 1", description: "Description", price: 29.99, imageName: "related1", category: ""),
    ProductDetails(name: "Related Product 2", description: "Description", price: 39.99, imageName: "related2", category: ""),
]

struct ProductDetails: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var price: Double
    var imageName: String
    var category: String
}

struct ClothView: View {
    let product: ProductDetails

    var body: some View {
        VStack(spacing: 20) {
            // Product image
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .padding(.top)

            // Product details
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)

                Text(product.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom)

                Text("$\(product.price)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.bottom)

                Button(action: {
                    // Add to cart action
                }) {
                    Text("Add to Cart")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.bottom)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.systemGray5))
            )
            .padding(.horizontal)

            // Related Products
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(relatedProducts) { product in
                        RelatedProductView(product: product)
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 200)
        }
        .navigationTitle("Clothing Detail")
    }
}

struct RelatedProductView: View {
    let product: ProductDetails

    var body: some View {
        VStack(spacing: 10) {
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(8)

            Text(product.name)
                .font(.headline)
                .fontWeight(.bold)

            Text("$\(product.price)")
                .font(.subheadline)
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

// Usage
struct ClothContentView: View {
    var body: some View {
        let product = ProductDetails(name: "Product 1", description: "Description", price: 49.99, imageName: "product1", category: "")
        ClothView(product: product)
    }
}






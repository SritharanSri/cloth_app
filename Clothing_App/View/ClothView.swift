//
//  ClothView.swift
//  Clothing_App
//
//  Created by NIBM on 2024-03-23.
//

import SwiftUI
struct ProductDetails: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let price: Double
    let imageName: String
    let category: String // Add category property

    // Initialize with all properties
    init(name: String, description: String, price: Double, imageName: String, category: String) {
        self.name = name
        self.description = description
        self.price = price
        self.imageName = imageName
        self.category = category
    }
}
struct ClothView: View {
    let product: Product

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Image(systemName: "photo") // Placeholder image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding()

                    VStack(alignment: .leading, spacing: 16) {
                        Text(product.name)
                            .font(.title)
                            .fontWeight(.bold)

                        Text(product.description)
                            .font(.body)
                            .foregroundColor(.secondary)

                        Text("$\(product.price)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)

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
                    }
                    .padding()
                }
            }
            .navigationTitle("Clothing Detail")
            .frame(maxWidth: .infinity)

            Text("Related Products")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(relatedProducts) { product in
                        RelatedProductView(product: product)
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 200) // Adjust the height as needed
        }
    }

    // Example related products
    var relatedProducts: [Product] {
        // Provide your related products here
        return [
            
            Product(name: "Related Product 1", price: 29.99, category: "Good", description: "Description"),
            Product(name: "Related Product 2", price: 39.99, category: "Good", description: "Description"),
            Product(name: "Related Product 3", price: 49.99, category: "Bad", description: "Description"),
            Product(name: "Related Product 4", price: 59.99, category: "Exelent", description: "Description")
        ]
    }
}

struct RelatedProductView: View {
    let product: Product

    var body: some View {
        VStack {
            Image(systemName: "photo") // Placeholder image
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
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

// Usage
struct ClothContentView: View {
    var body: some View {
        let product = Product(name: "Product 1", price: 49.99, category: "Good", description: "This dress is made of high-quality fabric and is perfect for any occasion.")
        // Create an instance of Product, not ProductDetails
        ClothView(product: product) // Pass the product instance to ClothView
    }
}


struct ClothView_Previews: PreviewProvider {
    static var previews: some View {
        ClothContentView()
    }
}




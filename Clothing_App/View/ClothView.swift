//
//  ClothView.swift
//  Clothing_App
//
//  Created by NIBM on 2024-03-23.
//

import SwiftUI
struct Products {
    let name: String
    let description: String
    let price: Double
    let imageName: String
}

struct ClothView: View {
    let product: Products

    var body: some View {
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

            Spacer()
        }
        .navigationTitle("Clothing Detail")
    }
}

// Usage
struct ClothcontentView: View {
    var body: some View {
        let product = Products(name: "Beautiful Dress", description: "This dress is made of high-quality fabric and is perfect for any occasion.", price: 99.99, imageName: "dress_image")
        ClothView(product: product)
    }
}

struct ClothView_Previews: PreviewProvider {
    static var previews: some View {
        ClothcontentView()
    }
}



//
//  HomeView.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-20.
//

import SwiftUI
struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let category: String
    let description: String
}

struct HomeView: View {
    @State private var showMenu = false
    @State private var selectedCategory = "All"
    
    let categories = ["All", "Category 1", "Category 2", "Category 3"]

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Location").foregroundColor(.black)
                    Spacer()
                    Image(systemName: "bell").frame(width: 30, height: 20, alignment: .leading)
                    Image(systemName: "bag").frame(width: 30, height: 20).font(.system(size: 20))
                    Image(systemName: "line.horizontal.3").font(.system(size: 20))
                        .frame(width: 30, height: 20, alignment: .leading)
                        .onTapGesture {
                            showMenu.toggle()
                        }
                }
                .padding()
                .frame(maxWidth: .infinity)

                Picker(selection: $selectedCategory, label: Text("Filter")) {
                    ForEach(categories, id: \.self) { category in
                        Text(category).tag(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)

                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(filteredProducts) { product in
                            ProductView(product: product)
                            
                        }
                    }
                    .padding(.vertical)
                }
                
            }
            .sheet(isPresented: $showMenu) {
                SideMenu()
            }
        }
    }

    var filteredProducts: [Product] {
        if selectedCategory == "All" {
            return products
        } else {
            return products.filter { $0.category == selectedCategory }
        }
    }

    let products: [Product] = [
        Product(name: "Product 1", price: 19.99, category: "Category 1", description: "Description"),
        Product(name: "Product 2", price: 29.99, category: "Category 2", description: "Description"),
        Product(name: "Product 3", price: 39.99, category: "Category 1", description: "Description"),
        Product(name: "Product 4", price: 49.99, category: "Category 3", description: "Description"),
        // Add more products as needed
    ]
}

struct ProductView: View {
    let product: Product

    var body: some View {
        HStack {
            Image(systemName: "photo") // Placeholder image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .cornerRadius(8)
            VStack(alignment: .leading){
                Text(product.name)
                Spacer()
                Text(String(format: "$%.2f", product.price)) .foregroundColor(.secondary)
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .padding()
            VStack{
                Image(systemName: "heart").font(.system(size: 20)).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Image(systemName: "plus.circle").font(.system(size: 20))
                    .foregroundColor(.blue)
                    .padding()
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .padding(.horizontal)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



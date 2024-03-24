//
//  HomeView.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-20.
//

import SwiftUI




struct ProductView: View {
    let product: Product
    @State private var isShowing = false
    @State private var selectedItem = 0
    

    var body: some View {
        VStack(alignment: .leading) {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .cornerRadius(10)

            Text(product.name)
                .font(.title2)
                .bold()
                .padding(.top, 8)

            Text(product.category)
                .font(.caption)
                .foregroundColor(.gray)

            Text(product.description)
                .font(.caption2)
                .foregroundColor(.gray)
                .padding(.top, 8)

            HStack {
                Text("$ \(product.price, specifier: "%.2f")")
                    .font(.title2)
                    .bold()

                Spacer()

                Button(action: {}) {
                    Text("Add to Cart")
                        .font(.caption2)
                        .bold()
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            }
            .padding(.top, 16)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

struct HomeView: View {
    @State private var showNoty = false
    @State private var selectedCategory = "All"
    @State private var sideMenuIsShowing = false

    let categories = ["All", "Category 1", "Category 2", "Category 3"]

    var body: some View {
        ZStack {
            Color(.systemGray6)
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Text("Location")
                        .font(.system(size: 18))
                        .foregroundColor(.black)

                    Spacer()

                    Button(action: {
                        showNoty.toggle()
                    }) {
                        Image(systemName: "bell")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(.gray)
                    }.padding(.leading, 10)

                    Button(action: {}) {
                        Image(systemName: "bag")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(.gray)
                    }.padding(.leading, 10)

                    Button(action: {
                        sideMenuIsShowing.toggle()
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 10)
                }
                .padding()

                Picker(selection: $selectedCategory, label: Text("Filter")) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                            .tag(category)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                }

                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(0..<5) { _ in
                            ProductView(product: Product(
                                name: "Product 1",
                                price: 19.99,
                                category: "Category 1",
                                description: "This is a description for product 1",
                                imageName: "product1"
                            ))
                        }
                    }
                }
            }

            if sideMenuIsShowing {
                SideMenu(isShowing: $sideMenuIsShowing)
                    .frame(width: 278)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var category: String
    var description: String
    var imageName: String
}



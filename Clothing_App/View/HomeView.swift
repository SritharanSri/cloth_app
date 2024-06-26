//
//  HomeView.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-20.
//

import SwiftUI
import URLImage




struct HomeView: View {
    @State private var isEditing = false
    @State private var search: String = ""
    @State private var selectedCategory = "All"
    @State private var sideMenuIsShowing = false
    @StateObject var viewModel: ProductViewModel = ProductViewModel()
    @State private var showProductView = false
    
    let categories = ["All", "men", "women", "Kids"]
    
    var body: some View {
        NavigationView{
            VStack {
              
                
                VStack {
                    HStack {
                        Text("Location")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                    
                        NavigationLink(destination: CartView()) {
                            Image(systemName: "bag")
                                .resizable()
                                .frame(width: 22, height: 22)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading, 10)
                        
                        Button(action: {
                            sideMenuIsShowing.toggle()
                            print("sideMenuIsShowing toggled to \(sideMenuIsShowing)")
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .resizable()
                                .frame(width: 22, height: 22)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading, 10)
                    }
                    .padding()
                    
                    TextField("Search", text: $search)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    Picker(selection: $selectedCategory, label: Text("Filter")) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                                .tag(category)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(viewModel.products.filter { product in
                            let productNameMatch = search.isEmpty || product.productName.lowercased().contains(search.lowercased())
                            let categoryMatch = selectedCategory == "All" || product.category == selectedCategory
                            return productNameMatch && categoryMatch
                        }) { product in
                            NavigationLink(destination: ClothView(productID: product.id ?? "")) {
                                VStack(alignment: .leading) {
                                    URLImage(URL(string: product.image)!) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 150)
                                            .cornerRadius(10)
                                    }
                                    Text(product.productName)
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
                                    
                                }
                                
                            }.navigationBarBackButtonHidden(true)
                        }
                    }.padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill available space with ScrollView
            .overlay(
                        Group {
                            if sideMenuIsShowing {
                                Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
                                 SideMenu(isShowing: $sideMenuIsShowing, isCart: false, isProfile: false)
                            }
                        }
                    )
       
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ProductViewModel())
    }
}






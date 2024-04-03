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
    @ObservedObject var viewModel: ProductViewModel
    init(productID: String) {
          self.productID = productID
          self.viewModel = ProductViewModel()
          viewModel.fetchProductDetails(for: productID)
      }
    var body: some View {
        VStack {
            
            HStack{
                
                   /* Image(systemName: "chevron.left")
                    .frame(width: 50,height: 50).background(Color.white).cornerRadius(10)
                Spacer()*/
                
                Text("Product Details").font(.title2).offset(x:-100)
                
            }.padding()
            
            
                if let product = viewModel.products.first(where: { $0.id == productID }) {
                    URLImage(URL(string: product.image)!) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width) // Adjust frame to screen width
                    }
                    
                
            
                    VStack(spacing: 4){
                        HStack(spacing: 100){
                            Text(product.productName).font(.system(size: 20))
                            Text("$\(product.price, specifier: "%.2f")").font(.system(size: 20))
                        }
                        Text("Category - \(product.category)").font(.system(size: 15)).bold().offset(x:-120,y:10)
                        Text("Description").font(.subheadline).offset(x:-130,y:20)
                        Text(product.description).font(.body).offset(y:20).padding(.leading,7).padding(.trailing,-5)
                        Spacer()
                    }.padding()
            }
            HStack{
                Button(action:{
                    //Code
                } ){
                    Text("Add Cart").font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 180, height: 50)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
                Button(action:{
                    //Code
                } ){
                    Text("Buy").font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 180, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }.offset(y: 10)
           
           
            
            
            
        }
    }
}
// Usage
struct ClothContentView: View {
    var body: some View {
        
        ClothView(productID: "")
    }
}






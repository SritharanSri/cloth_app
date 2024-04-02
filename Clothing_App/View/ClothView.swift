//
//  ClothView.swift
//  Clothing_App
//
//  Created by NIBM on 2024-03-23.
//

import SwiftUI


struct ClothView: View {
    let productID: String
    let images = ["view", "View2"]
    var body: some View {
        VStack {
            HStack{
                
                   /* Image(systemName: "chevron.left")
                    .frame(width: 50,height: 50).background(Color.white).cornerRadius(10)
                Spacer()*/
                
                Text("Product Details").font(.title2).offset(x:-100)
                
            }.padding()
            Spacer()
            ScrollView(.horizontal){
                HStack(spacing: 0) {
                                ForEach(images, id: \.self) { imageName in
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: UIScreen.main.bounds.width) // Adjust frame to screen width
                                }
                            }
                Spacer()
            }.edgesIgnoringSafeArea(.horizontal)
            VStack(spacing: 4){
                HStack(spacing: 190){
                    Text("Hoody").font(.title)
                    Text("$499").font(.title)
                }
                
                Text("Description").font(.subheadline).offset(x:-130)
                Text("Over the years, hoodies have evolved in design, with various styles, colors, and patterns available to suit different preferences and fashion trends.").font(.body).padding(.leading,7).padding(.trailing,-5)
                Spacer()
            }.padding()
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
            }.offset(y: -50)
           
           
            
            
            
        }
    }
}
// Usage
struct ClothContentView: View {
    var body: some View {
        
        ClothView(productID: "")
    }
}






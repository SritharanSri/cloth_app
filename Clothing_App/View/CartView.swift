//
//  CartView.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-26.
//


import SwiftUI

struct CartView: View {
    @State private var itemCount = 1
    @State private var itemCount01 = 1
    var body: some View {
        VStack{
            VStack{
                    Text("Cart Details").font(.title2)
            }
            Spacer()
            
            ScrollView{
                VStack{
                    HStack(spacing: 4){
                        Image("T shirt").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 120).cornerRadius(25)
                        VStack(spacing: 2){
                            HStack{
                                Text("Blue T-Shirt")
                                Spacer()
                                Text("$69.99").padding()
                            }
                            HStack{
                                Text("Blue").font(.system(size: 14))
                                    .foregroundColor(Color.gray)
                                Spacer()
                            }
                            HStack {
                                            Button(action: {
                                                // Decrease item count
                                                if itemCount > 1 {
                                                    itemCount -= 1
                                                }
                                            }) {
                                                Image(systemName: "minus.circle")
                                            }
                                            .padding()
                                            Text("\(itemCount)")
                                            Button(action: {
                                                // Increase item count
                                                itemCount += 1
                                            }) {
                                                Image(systemName: "plus.circle")
                                            }
                                            .padding()
                                Spacer()
                                        }
                            HStack{
                                Text("Remove").foregroundColor(.blue)
                                Spacer()
                            }
                        }
                    }
                    VStack{
                        Rectangle()
                                   .frame(width: 350,height: 1)
                                   .foregroundColor(Color.gray)
                    }
                    
                    HStack(spacing: 4){
                        Image("Shirt").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 120).cornerRadius(25)
                        VStack(spacing: 2){
                            HStack{
                                Text("Shirt")
                                Spacer()
                                Text("$89.99").padding()
                            }
                            HStack{
                                Text("Yellow").font(.system(size: 14))
                                    .foregroundColor(Color.gray)
                                Spacer()
                            }
                            HStack {
                                            Button(action: {
                                                // Decrease item count
                                                if itemCount01 > 1 {
                                                    itemCount01 -= 1
                                                }
                                            }) {
                                                Image(systemName: "minus.circle")
                                            }
                                            .padding()
                                            Text("\(itemCount01)")
                                            Button(action: {
                                                // Increase item count
                                                itemCount01 += 1
                                            }) {
                                                Image(systemName: "plus.circle")
                                            }
                                            .padding()
                                Spacer()
                                        }
                            HStack{
                                Text("Remove").foregroundColor(.blue)
                                Spacer()
                            }
                        }
                    }
                    VStack{
                        Rectangle()
                                   .frame(width: 350,height: 1)
                                   .foregroundColor(Color.gray)
                    }
                }
            }
            VStack{
                HStack{
                    Text("Order Information").font(.title2)
                    Spacer()
                }.padding()
                
                HStack{
                    Text("SubTotal").font(.system(size: 20))
                    Spacer()
                    Text("$160")
                }.padding()
                HStack{
                    Text("Shipping").font(.system(size: 20))
                    Spacer()
                    Text("$20")
                }.padding()
                Rectangle()
                           .frame(width: 380,height: 1)
                           .foregroundColor(Color.gray)
                HStack{
                    Text("Total").font(.title)
                    Spacer()
                    Text("$180").font(.title)
                }.padding()
               
                
            }
            Spacer()
            
            Button(action:{
                
            }){
                Text("Check Out")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 180, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}
    

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

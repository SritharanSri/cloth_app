//
//  PaymentView.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-29.
//

import SwiftUI

struct PaymentView: View {
    @State var showingBottomSheet = false
    
    var body: some View {
        VStack{
            VStack(spacing: 20){
                HStack{
                    
                        Image(systemName: "chevron.left")
                        .frame(width: 50,height: 50)
                    Spacer()
                    
                    Text("Payment").font(.title2).offset(x:-30)
                    Spacer()
                }.padding()
                
                VStack{
                    Text("To Be Paid").font(.system(size: 14)).foregroundColor(.black)
                    Text("$180").font(.system(size: 30))
                    
                }.frame(width: 300,height: 100).shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5).background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 2) // Adjust shadow properties for the background
                )
                VStack(spacing: 30){
                    HStack(spacing: 100){
                        Text("Location").font(.system(size: 14)).foregroundColor(.black).bold()
                        Text("Change Place").font(.system(size: 14)).foregroundColor(.blue).underline().offset(x:15)
                    }
                    
                    Text("33,Rajamalwatta,Colombo-15").font(.system(size: 20)).foregroundColor(.black).offset(y:-10)
                    
                }.frame(width: 300,height: 100).shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5).background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 2) // Adjust shadow properties for the background
                )
                
                HStack(spacing: 120){
                    Text("Payment Methods").font(.system(size: 16)).bold()
                   // Text("+ Add Card").font(.system(size: 16)).foregroundColor(.blue)
                    Button("+ Add Card") {
                    showingBottomSheet.toggle()
                    }.font(.system(size: 16))
                    
                    }
                    .padding()
                    .sheet (isPresented: $showingBottomSheet) {
                    BottomSheetView()
                            .presentationDetents([.height(350)])
                    }
                    
                }.offset(y:20)
                VStack {
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 300, height: 180)
                                .cornerRadius(15)
                                .overlay(
                                    VStack(alignment: .leading, spacing: 10) {
                                        HStack {
                                            Image(systemName: "creditcard")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.white)
                                            Spacer()
                                        }
                                        Spacer()
                                        Text("**** **** **** 1234")
                                            .font(.title)
                                            .foregroundColor(.white)
                                        Spacer()
                                        HStack {
                                            VStack(alignment: .leading, spacing: 4) {
                                                Text("CARD HOLDER")
                                                    .font(.caption)
                                                    .foregroundColor(.white)
                                                Text("S.Srikalaikshan")
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                            }
                                            Spacer()
                                            VStack(alignment: .trailing, spacing: 4) {
                                                Text("EXPIRES")
                                                    .font(.caption)
                                                    .foregroundColor(.white)
                                                Text("12/24")
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                            }
                                        }
                                    }
                                    .padding(20)
                                )
                        }
                        .padding()
            }
            Spacer()
            Button(action:{
                
            }){
                Text("Pay")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 180, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }.offset(y:-30)
        }
    }
struct BottomSheetView: View{
    @State private var CardName = ""
    @State private var CardNumber = ""
    @State private var Date = ""
    @State private var CVV = ""
    var body: some View{
        VStack(spacing: 5){
            VStack{
                HStack{
                    Text("Card Holder").font(.system(size: 15)).foregroundColor(Color.black).offset(x:-120)
                    
                }
                TextField("Card Holder", text: $CardName).frame(height: 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1) // Border color and width
                    )
                
            }.padding().offset(y:30)
            
            VStack{
                HStack{
                    Text("Account Number").font(.system(size: 15)).foregroundColor(Color.black).offset(x:-110)
                    
                }
                TextField("**** **** **** 1234", text: $CardNumber).frame(height: 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1) // Border color and width
                    )
               
            }.padding().offset(y:20)
            
            
            HStack{
                VStack{
                    Text("Expired Date").font(.system(size: 15)).foregroundColor(Color.black)
                    
                    TextField("00/00", text: $Date).frame(height: 40)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1) // Border color and width
                        )
                    Spacer()
                }.frame(width: 150).padding()
                VStack{
                    Text("CVV").font(.system(size: 15)).foregroundColor(Color.black)
                    
                    TextField("***", text: $Date).frame(height: 40)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1) // Border color and width
                        )
                    Spacer()
                }.frame(width: 150).padding()
            }
            Spacer()
        }
        Spacer()
        Button(action:{
            
        }){
            Text("Add Card")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .padding()
                .frame(width: 180, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
        }.offset(y:-10)
    }
    
    
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}

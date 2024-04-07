//
//  SideMenu.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-20.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isShowing: Bool
    @State var isCart: Bool
    @State var isProfile: Bool
    @State private var backgroundColor = Color.white
    
    var body: some View {
        VStack {
            VStack {
                SideMenuHeader(isShowing: $isShowing)
                
                Spacer()
                
               
                NavigationLink(destination: Profile_settings(), isActive: $isProfile) {
                    HStack {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .padding()
                    .foregroundColor(.black)
                }.offset(y: -480)
                
              
               
                NavigationLink(destination: CartView(), isActive: $isCart) {
                    HStack {
                        Image(systemName: "bag")
                        Text("Add Cart")
                    }
                    .padding()
                    .foregroundColor(.black)
                
                }.offset(y:-480)
                
                
            }
            .padding()
            .background(
                ZStack {
                    backgroundColor
                    LinearGradient(
                        gradient: Gradient(colors: [.white.opacity(0.8), .clear]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 100)
                }
            )
            .cornerRadius(10)
            .shadow(radius: 10)
            .frame(width: 278, alignment: .trailing)
            .animation(.spring())
            .onAppear {
                backgroundColor = Color(.white)
            }
        }
    }
    
    
}

struct SideMenu_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}


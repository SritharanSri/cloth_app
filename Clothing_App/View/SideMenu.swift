//
//  SideMenu.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-20.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isShowing: Bool
    //@State private var searchActive = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 32) {
                SideMenuHeader(isShowing: $isShowing)
                
                Spacer()
                
                Button(action: {
                    isShowing = false
                }) {
                    HStack {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .padding()
                    .foregroundColor(.black)
                    .background(
                       /* ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                            if searchActive {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(.sRGB, red: 240/255, green: 240/255, blue: 240/255, opacity: 1))
                            }
                        }
                        */
                    )
                }
                
                Button(action: {
                    isShowing = false
                }) {
                    HStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    .padding()
                    .foregroundColor(.black)
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                           /* if searchActive {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(.sRGB, red: 240/255, green: 240/255, blue: 240/255, opacity: 1))
                            }*/
                        }
                    )
                }
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
         /*   .onChange(of: searchActive) { newValue in
                if newValue {
                    backgroundColor = Color(.sRGB, red: 240/255, green: 240/255, blue: 240/255, opacity: 1)
                } else {
                    backgroundColor = Color(.white)
                }
            }
            .offset(y: isShowing ? 0 : -278)*/
        }
    }
    
    
}

struct SideMenu_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}


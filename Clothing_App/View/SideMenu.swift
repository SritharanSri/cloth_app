//
//  SideMenu.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-20.
//

import SwiftUI

struct SideMenu: View {
   // @Binding var isShowing: Bool
    var body: some View {
       // ZStack{
         //   if isShowing{
           //     Rectangle().opacity(0.03).ignoresSafeArea().onTapGesture {
             //       isShowing.toggle()
               // }
       //         HStack{
         //           VStack(alignment: .leading,spacing: 32){
           //             SideMenuHeader()
                        
             //           Spacer()
               //     }.background(.white).frame(width: 278, alignment: .trailing)
                    
                 //   Spacer()
      //          }
        //  }
      //}
        
        NavigationView{
            NavigationLink(destination: Text("Home")){ Label("Home", systemImage: "house")
            }
            NavigationLink(destination: Text("Profile")){ Label("Profile", systemImage: "person")
            }
            NavigationLink(destination: Text("Settings")){ Label("Settings", systemImage: "gear")
            }
        }.listStyle(SidebarListStyle())
            .navigationTitle("Menu")
        
        Text("Select an item from the menu").frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
struct Home:View {
    var body: some View {
        Text("Home View")
            .navigationTitle("Home")
    }
}
struct Profile:View {
    var body: some View {
        Text("Profile View")
            .navigationTitle("Profile")
    }
}
struct Settings:View {
    var body: some View {
        Text("Settings View")
            .navigationTitle("Settings")
    }
}
struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}

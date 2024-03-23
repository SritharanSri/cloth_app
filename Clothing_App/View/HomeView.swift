//
//  HomeView.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-20.
//

import SwiftUI

struct HomeView: View {
    @State private var showMenu = false
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 4){
                        Text("Location").foregroundStyle(.black)
                        HStack{
                            
                            Text("Colombo,SriLanka.") .font(.system(size: 15))
                            Image(systemName: "chevron.down")
                        }
                        
                    }.padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                   // Image(systemName: "bell").frame(width: 30, height: 20)
                    NavigationLink(destination: NotificationView(), label: {Image(systemName: "bell").frame(width: 30, height: 20, alignment: .leading)}).navigationTitle("Notification").navigationBarHidden(true)
                    
                    Image(systemName: "bag").frame(width: 30, height: 20)
                    
                    Image(systemName: "line.horizontal.3").frame(width: 30, height: 20, alignment: .leading).onTapGesture {
                        
                        showMenu.toggle()
                    }
                               
                            }
                Spacer()
                            
            }.sheet(isPresented: $showMenu){
                SideMenu()
            }
        }
        
                
            }
        }
    


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

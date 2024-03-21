//
//  SideMenu.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-20.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack{
            if isShowing{
                Rectangle().opacity(0.03).ignoresSafeArea().onTapGesture {
                    isShowing.toggle()
                }
                HStack{
                    VStack(alignment: .leading,spacing: 32){
                        SideMenuHeader()
                        
                        Spacer()
                    }.background(.white).frame(width: 278, alignment: .trailing)
                    
                    Spacer()
                }
            }
        }
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(isShowing: .constant(false))
    }
}

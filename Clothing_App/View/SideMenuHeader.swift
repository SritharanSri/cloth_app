//
//  SideMenuHeader.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-24.
//

import SwiftUI

struct SideMenuHeader: View {
    @Binding var isShowing: Bool
    var body: some View {
        HStack {
          Image("Avatar").resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(.bottom, 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 200)
                        .stroke(Color.gray, lineWidth: 1).padding(.bottom, 20)
                )
            VStack(spacing: 4){
                Text("SriKalai").offset(x: -40)
                Text("ssrikalai2255@gmail.com").font(.system(size: 12))
            }.offset(y: -10)
            
        }
        .padding()
        .foregroundColor(.black)
        .background(Color.white)
        .cornerRadius(10)
        
    }
}

struct SideMenuHeader_Previews: PreviewProvider {
    @State static var isShowing = false

    static var previews: some View {
        SideMenuHeader(isShowing: $isShowing)
    }
}

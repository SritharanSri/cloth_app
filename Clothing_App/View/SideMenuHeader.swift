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
            Image(systemName: "person")
            Text("Srikalai")
                .font(.title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "xmark")
                .onTapGesture {
                    isShowing = false
                }
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

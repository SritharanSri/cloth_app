//
//  SideMenuHeader.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-20.
//

import SwiftUI

struct SideMenuHeader: View {
    var body: some View {
        HStack{
            Image(systemName: "person.circle.fill").imageScale(.large).foregroundStyle(.white).frame(width: 48, height: 48).background(.blue).clipShape(RoundedRectangle(cornerRadius: 10)).padding(.vertical)
            
            VStack(alignment: .leading, spacing: 6){
                Text("Srikalaikshan").font(.subheadline)
                
                Text("ssrikalai2255@gmail.com").font(.footnote).tint(.gray)
            }
        }
        
    }
}

struct SideMenuHeader_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeader()
    }
}

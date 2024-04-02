//
//  LogIn.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-19.
//

import SwiftUI

struct LogIn: View {
    @State var username=""
    @State var password=""
    @State private var isNavigationActive = false
    var body: some View {
        NavigationView{
            ZStack {
                Image("Login")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
                    .padding()
                
                VStack{
                    Text("LOGIN").font(.largeTitle).bold().padding()
                    HStack{
                        Image(systemName: "person")
                        TextField("Login Name",text: $username)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                        
                    }
                    HStack{
                        Image(systemName: "lock")
                        SecureField("Password",text: $password)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                    }
                    HStack{
                        NavigationLink(destination: HomeView(), isActive: $isNavigationActive) {
                            Button("LOGIN"){
                                //
                            }.foregroundColor(.white)
                                .frame(width: 250,height: 40)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }.navigationBarBackButtonHidden(true)
                    }.padding()
                    
                    
                    HStack{
                        Text("Create an account?").font(.system(size: 15))
                        
                        NavigationLink(destination: SignUp(), label: {Text("SIGN UP").foregroundColor(.blue).font(.system(size:15))}).navigationBarBackButtonHidden(true)
                        // Text("SIGN UP").foregroundColor(.blue).font(.system(size:15))
                    }.padding()
                }.frame(width: 350, height: 300).background(Color.white).shadow(radius: 50).cornerRadius(20)
            }
            .padding()
        }
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}

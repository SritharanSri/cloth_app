//
//  SignUp.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-19.
//

import SwiftUI

struct SignUp: View {
    @State var username=""
    @State var email=""
    @State var password=""
    @State var Cpassword=""
    var body: some View {
        
            ZStack {
                Image("Login")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
                    .padding()
                
                VStack{
                    Text("Register").font(.largeTitle).bold().padding()
                    HStack{
                        Image(systemName: "person")
                        TextField("User Name",text: $username)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                        
                    }
                    HStack{
                        Image(systemName: "mail")
                        TextField("Email",text: $email)
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
                        Image(systemName: "lock")
                        SecureField("Confirm Password",text: $Cpassword)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                    }
                    HStack{
                        Button("SIGNUP"){
                            //
                        }.foregroundColor(.white)
                            .frame(width: 250,height: 40)
                            .background(Color.purple)
                            .cornerRadius(10)
                    }.padding()
                    
                   
            }.frame(width: 350, height: 400).background(Color.white).shadow(radius: 50).cornerRadius(20)
        }
        .padding()
   
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

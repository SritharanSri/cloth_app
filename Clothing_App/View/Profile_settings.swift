//
//  Profile_settings.swift
//  Clothing_App
//
//  Created by NIBMPC04PC03 on 2024-03-23.
//

import SwiftUI

struct Profile_settings: View {
    @State private var fullName = "Srikalai"
    @State private var email = "ssrikalai2255@gmail.com"
    @State private var phoneNumber = "076-679-1679"
    @State private var isEditing = true
    @State private var profileImage: Image? = Image(systemName: "person.circle.fill")
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            
                        Button("Go back") {
                            dismiss()
                        }
                    Color(.systemGroupedBackground)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Spacer()
                        
                        // Profile Picture
                        profileImage?
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding(.bottom, 20)
                        
                        VStack(spacing: 20) {
                            TextField("Full Name", text: $fullName)
                                .textFieldStyle(ProfileTextFieldStyle(isEditing: isEditing))
                                .disabled(!isEditing)
                            
                            TextField("Email", text: $email)
                                .textFieldStyle(ProfileTextFieldStyle(isEditing: isEditing))
                                .disabled(!isEditing)
                            
                            TextField("Phone Number", text: $phoneNumber)
                                .textFieldStyle(ProfileTextFieldStyle(isEditing: isEditing))
                                .disabled(!isEditing)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation {
                                isEditing.toggle()
                            }
                        }) {
                            Text(isEditing ? "Done" : "Edit")
                                .padding(.horizontal, 40)
                                .padding(.vertical, 12)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .font(.headline)
                                .cornerRadius(30)
                        }
                        .padding(.bottom, 20)
                    }
                }
                .navigationBarTitle("Profile Settings")
            }
        }

        struct ProfileTextFieldStyle: TextFieldStyle {
            var isEditing: Bool
            
            func _body(configuration: TextField<Self._Label>) -> some View {
                configuration
                    .padding(15)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isEditing ? Color.blue : Color.gray, lineWidth: 2)
                    )
                    .foregroundColor(.primary)
                    .font(.body)
            }
        }

    

struct Profile_settings_Previews: PreviewProvider {
    static var previews: some View {
        Profile_settings()
    }
}

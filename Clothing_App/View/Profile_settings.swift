//
//  Profile_settings.swift
//  Clothing_App
//
//  Created by NIBMPC04PC03 on 2024-03-23.
//

import SwiftUI
import PhotosUI

struct Profile_settings: View {
    @State private var fullName = "Srikalai"
    @State private var email = "ssrikalai2255@gmail.com"
    @State private var phoneNumber = "076-679-1679"
    @State private var isEditing = true
    @State private var profileImage: Image?
    @State private var selectedGender = "Male"
        let genders = ["Male", "Female", "Other"]
    @State private var isDropdownExpanded = false
    @State private var birthDate = Date()
    @State private var selectedImages: [UIImage] = []
       @State private var isShowingPicker = false
    let defaultImage = UIImage(named: "Avatar")
    /* @Environment(\.dismiss) var dismiss*/
    
    var body: some View {
        VStack{
            
                Text("Profile Details").font(.title2)
                Spacer()
            
        }
        Spacer()
        VStack {
            if !selectedImages.isEmpty {
                        ForEach(selectedImages, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .padding(.bottom, 20)
                                    .overlay(
                                                    RoundedRectangle(cornerRadius: 200)
                                                        .stroke(Color.gray, lineWidth: 1).padding(.bottom, 20)
                                                )
                        }
                    } else{
                        // Show default image when selectedImages is empty and selected gender is valid
                        Image(uiImage: defaultImage ?? UIImage())
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding(.bottom, 20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 200)
                                    .stroke(Color.gray, lineWidth: 1).padding(.bottom, 20)
                            )
                            
                        Button(action: {
                            isShowingPicker = true
                        }) {
                            Image(systemName: "pencil.circle")
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .clipShape(Circle())
                                .padding()
                        }.offset(x: 30, y: -65)
                         
                    }
        }.offset(y:-50)
                .sheet(isPresented: $isShowingPicker) {
                    ImagePicker(images: $selectedImages)
                }
        VStack{
           
            VStack{
                HStack{
                    Text("Full Name").font(.system(size: 15)).foregroundColor(Color.gray)
                    Spacer()
                }.padding(.leading,20)
                TextField("Full Name", text: $fullName).frame(height: 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray, lineWidth: 1) // Border color and width
                                    ).padding(.leading,20).padding(.trailing,20)
                
               
                
                VStack{
                    HStack{
                        Text("Email Address").font(.system(size: 15)).foregroundColor(Color.gray)
                        Spacer()
                    }.padding(.leading,20)
                    TextField("Email Address", text: $email).frame(height: 40)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.gray, lineWidth: 1) // Border color and width
                                        ).padding(.leading,20).padding(.trailing,20)
                    Spacer()
                }
                
                VStack{
                    HStack{
                        Text("Phone Numer").font(.system(size: 15)).foregroundColor(Color.gray)
                        Spacer()
                    }.padding(.leading,20)
                    TextField("Phone Number", text: $phoneNumber).frame(height: 40)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.gray, lineWidth: 1) // Border color and width
                                        ).padding(.leading,20).padding(.trailing,20)
                Spacer()
                }
            
            HStack(spacing: 10){
                VStack{
                    Text("Gender").font(.system(size: 15)).foregroundColor(Color.gray).padding(.leading,-50)
                    VStack {
                        TextField("Gender", text: $selectedGender).disabled(true).frame(width: 160,height: 40)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(Color.gray, lineWidth: 1) // Border color and width
                                            ).padding(.leading,20)
                                            
                                            VStack {
                                                ForEach(genders, id: \.self) { gender in
                                                    Button(action: {
                                                        selectedGender = gender
                                                        isDropdownExpanded.toggle()
                                                    }) {
                                                        Text(gender).foregroundColor(.black)
                                                    }.frame(width:150)
                                                     .background(Color.white)
                                                }.background(Color.white)
                                            }
                                            .cornerRadius(8)
                                            .shadow(radius: 2)
                                            .opacity(isDropdownExpanded ? 1 : 0) // Set opacity based on expansion state
                                            .animation(.easeInOut) // Add animation
                    }.padding(.leading,-15)
                                        .onTapGesture {
                                            isDropdownExpanded.toggle()
                                        }
                                    }
                                    
                                    .zIndex(isDropdownExpanded ? 1 : 0)
                                    
                                    Spacer()
                VStack{
                    Text("Date of Birth").font(.system(size: 15)).foregroundColor(Color.gray)
                    
                    DatePicker(
                                       "",
                                       selection: $birthDate,
                                       displayedComponents: [.date]
                                   )
                    .frame(width: 160, height: 40)
                                   
                                   .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1) // Border color and width
                                )
                }.offset(x:-50,y:-40)
                
            }.offset(x:20)
            
            }.offset(y:-40)
            Button(action:{
                
            }){
                Text("Edit Profile")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 180, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
               
            }.offset(y:-20)
        }
    }
}


   
    
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var images: [UIImage]

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 0 // Unlimited selection
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.images.removeAll()
            for result in results {
                result.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                    if let image = image as? UIImage {
                        self.parent.images.append(image)
                    }
                }
            }
            picker.dismiss(animated: true)
        }
    }
}
struct Profile_settings_Previews: PreviewProvider {
    static var previews: some View {
        Profile_settings()
    }
}

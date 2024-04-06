//
//  LocationView.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-29.
//

import SwiftUI


struct LocationView: View {
    @ObservedObject var locationManager = LocationManager()
    var body: some View {
        ZStack {
            Color(.systemBlue).ignoresSafeArea()
            VStack {
                
                Spacer()
                Image (systemName: "paperplane.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding (.bottom, 32)
                Text("Would you like to explore places nearby?")
                    .font(.system (size: 28, weight: .semibold))
                    .multilineTextAlignment (.center)
                    .padding()
                Text("Start sharing your location with us")
                    .multilineTextAlignment (.center)
                    .frame(width: 140)
                    .padding()
                Spacer()
                
                VStack {
                    Button(action: {
                        locationManager.requestLocation()
                    }) {
                        Text("Allow location")
                            .padding()
                            .font(.headline)
                            .foregroundColor(Color(.systemBlue))
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.horizontal, -32)
                    .background (Color.white)
                    .clipShape (Capsule ( ) )
                    .padding()
                    Button {
                        print("Dismiss")
                    } label: {
                        Text("Maybe later")
                            .padding()
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }.padding(.bottom,32)
            }
            .foregroundColor(.white)
        }.onAppear {
            locationManager.startUpdatingLocation()
        }
    }
}


struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

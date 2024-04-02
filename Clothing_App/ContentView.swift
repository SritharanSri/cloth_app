//
//  ContentView.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-16.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager.shared
    var body: some View {
        Group{
            if locationManager.userLocation == nil {
            LocationView()
            } else if let location = locationManager.userLocation {
                Text("\(location)")
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

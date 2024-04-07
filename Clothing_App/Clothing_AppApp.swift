//
//  Clothing_AppApp.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-16.
//

import SwiftUI

@main
struct Clothing_AppApp: App {
    @ObservedObject var locationManager = LocationManager.shared
    var body: some Scene {
        WindowGroup {
         
            HomeView()
        }
    }
}

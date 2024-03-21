//
//  NotificationView.swift
//  Clothing_App
//
//  Created by Srikalai on 2024-03-21.
//

import SwiftUI

struct NotificationView: View {
    @State private var selectedFilterIndex = 0
       @State private var notifications = Array(repeating: "Notification", count: 20)
    
    var filters = ["All", "Unread", "Read"]
    var filteredNotifications: [String] {
            switch selectedFilterIndex {
            case 0: // All
                return notifications
            case 1: // Unread
                return notifications.filter { _ in true } // Placeholder for actual unread filter logic
            case 2: // Read
                return notifications.filter { _ in false } // Placeholder for actual read filter logic
            default:
                return notifications
            }
        }
    var body: some View {
       Form {
            // Filter Dropdown
            
            Picker("Filter", selection: $selectedFilterIndex) {
                                ForEach(0..<filters.count) { index in
                                    Text(filters[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // Notification List
           List(filteredNotifications, id: \.self) { notification in
                               Text(notification)
                           }
                
                Button(action: loadMoreNotifications) {
                    Text("Load More")
                        .padding()
                }
                
            }.listStyle(SidebarListStyle()).padding(.top,75).frame(maxWidth: .infinity, alignment: .topLeading).edgesIgnoringSafeArea(.vertical)
        }
    func loadMoreNotifications() {
           notifications.append(contentsOf: Array(repeating: "Notification", count: 20))
       }
    }

   

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}

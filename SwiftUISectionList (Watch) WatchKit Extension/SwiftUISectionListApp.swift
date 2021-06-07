//
//  SwiftUISectionListApp.swift
//  SwiftUISectionList (Watch) WatchKit Extension
//
//  Created by Christian on 07.06.21.
//

import SwiftUI

@main
struct SwiftUISectionListApp: App {
   
   @StateObject var store: ItemStore = ItemStore()
   
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SectionListView()
                  .environmentObject(store)
            }
        }
    }
}

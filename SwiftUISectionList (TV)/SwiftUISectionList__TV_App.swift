//
//  SwiftUISectionList__TV_App.swift
//  SwiftUISectionList (TV)
//
//  Created by Christian on 07.06.21.
//

import SwiftUI

@main
struct SwiftUISectionList__TV_App: App {
   
   @StateObject var store: ItemStore = ItemStore()
  
   
    var body: some Scene {
        WindowGroup {
            SectionListView()
               .environmentObject(store)
               .listStyle(GroupedListStyle())
        }
    }
}

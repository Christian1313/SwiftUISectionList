//
//  SwiftUISectionListApp.swift
//  Shared
//
//  Created by Christian on 07.06.21.
//

import SwiftUI


@main
struct SwiftUISectionListApp: App {
   
   @StateObject var store: ItemStore = ItemStore()
   
   var body: some Scene {
      WindowGroup {
         SectionListView()
            .environmentObject(store)
            .listStyle(SidebarListStyle())
         
      }
   }
}

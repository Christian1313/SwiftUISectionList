//
//  ContentView.swift
//  Shared
//
//  Created by Christian on 07.06.21.
//

import SwiftUI

struct SectionListView: View {
    
   // usally this is @EnvironmetObject, due to simplicity I put it here
   @EnvironmentObject var store: ItemStore
   
   @SceneStorage(AppKeys.SceneSelectionID.rawValue) private var sceneItemID: String?
   
   var body: some View {
      NavigationView {
         
         List {
            Section(header: Text("Favorites")) {
               ForEach(store.scopedItems(isFav: true)) { scopedItems in
                  NavigationLink(
                     destination: DetailView(item: $store.items[scopedItems.index]),
                     //MARK: !! IMPORTANT: use unique indetifier as tag
                     tag: store.items[scopedItems.index].id,
                     selection: $sceneItemID,
                     label: {
                        RowView(item: $store.items[scopedItems.index])
                     })
               }
            }
            Section(header: Text("Others")) {
               ForEach(store.scopedItems(isFav: false)) { scopedItems in
                  NavigationLink(
                     destination: DetailView(item: $store.items[scopedItems.index]),
                     //MARK: !! IMPORTANT: use unique indetifier as tag
                     tag: store.items[scopedItems.index].id,
                     selection: $sceneItemID,
                     label: {
                        RowView(item: $store.items[scopedItems.index])
                     })
                  
               }
            }
         }
         .navigationTitle("Items")
      }
   }
   
   
}


// MARK: Row View

/// RowView for item, tapping the text toggle the `isFav` state
struct RowView: View {
   
   @Binding var item: Item
   
   var body: some View {
      Label(
         title: { Text(item.text) },
         icon: { item.isFav ? Image(systemName: "star.fill") : Image(systemName: "star")}
      )
   }
}

// MARK: Detail View

/// DetailView to change item `text` and toggle `isFav` state
struct DetailView: View {
   
   @Binding var item: Item
   
   @SceneStorage(AppKeys.SceneSelectionID.rawValue) private var sceneItemID: String?
   
   var body: some View {
      VStack {
         Spacer()
            .frame(height: 20.0)
         TextField("Title", text: $item.text)
            .background(Color.gray.opacity(0.2))
            .padding(10)
         Toggle("Favorite:", isOn: $item.isFav.animation())
            .padding()
         Spacer()
      }
      .navigationTitle(item.text)
      .padding()
      .onAppear() {
         //MARK: !! IMPORTANT set scene selction id again
         sceneItemID = item.id
      }
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      SectionListView()
         .environmentObject(ItemStore())
    }
}

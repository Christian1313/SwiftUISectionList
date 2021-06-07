//
//  DataModel+Store.swift
//  SwiftUISectionList
//
//  Created by Christian on 07.06.21.
//

import Foundation

enum AppKeys: String {
   case SceneSelectionID = "SceneSelectionID"
}


//MARK: - Data Model

struct Item: Identifiable, Equatable, Hashable {
   var id = UUID().uuidString
   var isFav = false
   var text: String
}

struct ItemScoped: Identifiable, Equatable, Hashable {
   var id: String {
      return item.id
   }
   var item: Item
   var index: Int
}

//MARK: Store

class ItemStore: ObservableObject {
   
   @Published var items = [Item(id: "uuid01", text: "Item 1"),
                           Item(id: "uuid02", text: "Item 2"),
                           Item(id: "uuid03", isFav: true, text: "Item 3"),
                           Item(id: "uuid04", text: "Item 4")]
   
   
   /// scope item to sections and keep knowledge of origin index
   func scopedItems(isFav: Bool) -> [ItemScoped] {
      let sItems: [ItemScoped]  = items.compactMap {
         guard let idx = items.firstIndex(of: $0) else { return nil }
         //find(items, $0)
         return ItemScoped(item: $0, index: idx)
      }
      return sItems.filter { $0.item.isFav == isFav }
   }
}

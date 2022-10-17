//
//  ListViewModel.swift
//  TodoList
//
//  Created by Bishowjit Ray on 8/10/22.
//

import Foundation
/*
 CRUD FUNCTION
 Create
 Read
 Update
 Delete
 
 */

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    {
        didSet {
            saveItems()
            
        }
    }
    let itemKey: String = "items_list"
    init() {
        getItem()
    }
    
    func getItem () {
//        let newItems = [
//        ItemModel(title: "This is first title", isCompleted: false),
//        ItemModel(title: "This is the second!", isCompleted: true),
//        ItemModel(title: "Third", isCompleted: false),
//           ]
//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        self.items = savedItems
     }
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: true )
        items.append(newItem)
    }
    func updateItem(item: ItemModel){
       if  let index = items.firstIndex { (existingItem) -> Bool in
            return existingItem.id == item.id
        }
        {
            // run this code
        }
        
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
        
      
        }
    func saveItems(){
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeData, forKey: itemKey)
        }
    }
}

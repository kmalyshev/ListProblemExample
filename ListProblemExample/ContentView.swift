//
//  ContentView.swift
//  ListProblemExample
//
//  Created by Konstantin Malyshev on 12/27/20.
//

import SwiftUI

struct ContentView: View {
    
    let data = Item.getSampleData()
    
    var body: some View {
        List(data, id: \.id, children: \.children) { item in
            Text(item.name)
        }.listStyle(SidebarListStyle())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Item: Codable {
    
    let id: UUID
    let name: String
    let children: [Item]?
    
    init(id: UUID = UUID(), name: String, children: [Item]? = nil) {
        self.id = id
        self.name = name
        self.children = children
    }
    
    static func getSampleData() -> [Item] {
        
        [
            Item(name: "Item 00"),
            Item(
                name: "Item 01",
                children: [
                    Item(
                        name: "Item 10",
                        children: [
                            Item(name: "Item 20"),
                            Item(name: "Item 21"),
                        ]
                    ),
                    Item(name: "Item 11"),
                ]
            ),
            Item(name: "Item 02"),
        ]
    }
    
}

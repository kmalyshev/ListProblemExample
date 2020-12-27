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
        NavigationView {
            
            VStack {
                List(data, id: \.id, children: \.children) { item in
                    Text(item.name)
                }
            }
        }
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
            Item(name: "One"),
            Item(
                name: "Two",
                children: [
                    Item(
                        name: "SubitemOne",
                        children: [
                            Item(name: "LastOne"),
                            Item(name: "LastTwo"),
                        ]
                    ),
                    Item(name: "SubitemTwo"),
                ]
            ),
            Item(name: "Three"),
        ]
    }
    
}

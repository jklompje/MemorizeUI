//
//  ContentView.swift
//  MemorizeUI
//
//  Created by Jan Klompje on 2020-11-15.
//

import SwiftUI 

struct ContentView: View {
    
    let memoryItems = Bundle.main.decode([MemoryItem].self, from: "MemoryItems.json")
    
    var body: some View {
        NavigationView {
            
                List(memoryItems, id: \.self) { item in
                    NavigationLink(destination: MemoryView(memoryItem: item)) {
                        Text(item.title)
                            .padding()
                    }
                }.navigationBarTitle("Memory Items")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

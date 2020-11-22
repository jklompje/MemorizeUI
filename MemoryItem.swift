//
//  MemoryItem.swift
//  Memorize
//
//  Created by Paul Hudson on 29/01/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import Foundation

struct MemoryItem: Codable, Hashable {
    var title: String
    var text: String
    
    #if DEBUG
    static let example = MemoryItem(title: "Maple French Toast", text: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
    #endif
}

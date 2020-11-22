//
//  MemoryView.swift
//  MemorizeUI
//
//  Created by Jan Klompje on 2020-11-15.
//

import SwiftUI

struct MemoryView: View {
    var memoryItem: MemoryItem
    @State private var blankedText = ""
    @State private var blankCounter = 0
    
    var body: some View {
        VStack {
            Text(blankedText)
                .padding()
                .font(.custom("Georgia", size: 28))
            Spacer()
        }
        .onAppear(perform: showText)
        //Increase the tappable area...
        .frame( height: .infinity)
        //A more interesting background
        .background(LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .top, endPoint: .bottom))
        .onTapGesture {
            blankCounter += 1
            showText()
        }
    
    }

    func showText() {
        blankedText = memoryItem.text
        let words = blankedText.components(separatedBy: " ")
        var output = ""
        let space = " "
        for (index, word) in words.enumerated() {
            if index < blankCounter {
                //These are visible words. This is where he first changes the word to NSAttributed string
                output += "\(word) "
            } else {
                // make a copy of the word
                var strippedWord = word
                //Place all punctuation in a String.
                //It checks the last element of every word
                var punctuation: String?
                if ".,".contains(word.last!) {
                    punctuation = String(strippedWord.removeLast())
                    print(punctuation!)
                }
                //let uniChar = "\u{24}" //Dollar sign
                let playChar = "\u{1F337}" //Tulip sign
                let blank = String(repeating: "\(playChar)", count: strippedWord.count)
                output.append("\(blank) ")
                if let symbol = punctuation {
                    output.append(symbol)
                }
            }
            output.append(space)
        }
        blankedText = output
    }
}

struct MemoryView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryView(memoryItem: MemoryItem.example)
    }
}

//
//  EmojiMemoryGame.swift
//  Memorise - The View Model
//
//  Created by Jerry Zhu on 23/9/21.
//
//

// Other private(set), view only

import SwiftUI

class EmojiMemoryGame {
    
    static let emojis = [ "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairOfCards: 4){
            pairIndex in EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

    // We are creating a copy, both arrays and cards are struct
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}


// private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairOfCards: 4, createCardContent: <#(Int) -> String#>)

//    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairOfCards: 4, createCardContent: {(index: Int) -> String in
//                return "😀"
//    })

//    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairOfCards: 4, createCardContent: {index in "😀"  })

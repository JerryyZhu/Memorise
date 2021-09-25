//
//  EmojiMemoryGame.swift
//  Memorise - The View Model
//
//  Created by Jerry Zhu on 23/9/21.
//
//

// Other private(set), view only

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame()
    static let emojis = [ "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairOfCards: 4){
            pairIndex in emojis[pairIndex]
        }
    }
    
    // We are creating a copy, both arrays and cards are struct
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}


// private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairOfCards: 4, createCardContent: <#(Int) -> String#>)

//    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairOfCards: 4, createCardContent: {(index: Int) -> String in
//                return "😀"
//    })

//    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairOfCards: 4, createCardContent: {index in "😀"  })

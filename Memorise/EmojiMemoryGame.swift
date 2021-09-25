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
    typealias Card = MemoryGame<String>.Card
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    private static let emojis = [ "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵"]
    
    private static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairOfCards: 12){
            pairIndex in emojis[pairIndex]
        }
    }
    
    // We are creating a copy, both arrays and cards are struct
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: Card){
        model.choose(card)
    }
}


// private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairOfCards: 4, createCardContent: <#(Int) -> String#>)

//    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairOfCards: 4, createCardContent: {(index: Int) -> String in
//                return "😀"
//    })

//    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairOfCards: 4, createCardContent: {index in "😀"  })

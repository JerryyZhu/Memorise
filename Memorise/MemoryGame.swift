//
//  MemoryGame.swift
//  Memorise
//
//  Created by Jerry Zhu on 23/9/21.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCardIndices = cards.indices.filter({ cards[$0].isFaceUp })
            return faceUpCardIndices.oneAndOnly
            // Alternatively {cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly } for one liner
        }
        set {
            // cards.indices.forEach({ cards[$0].isFaceUp = ($0 == newValue)})
            cards.indices.forEach({ index in cards[index].isFaceUp = (index == newValue)})
        }
    }
    
    mutating func choose(_ card: Card){
        print("\(cards)")
        if let chosenIndex = cards.firstIndex(
            where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
           
        }
        // A copy is made with structs, even with assignments
//        var chosenCard = cards[chosenIndex]
        print("\(cards)")
    }
    
    func index(of card: Card) -> Int?{
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 to cards array
        for pairIndex in 0..<numberOfPairOfCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element?{
        if self.count == 1{
            return self.first
        } else{
            return nil
        }
    }
}

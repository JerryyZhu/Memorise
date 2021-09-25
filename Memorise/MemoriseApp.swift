//
//  MemoriseApp.swift
//  Memorise
//
//  Created by Jerry Zhu on 23/9/21.
//

import SwiftUI

@main
struct MemoriseApp: App {
    // Class, this is a reference type / pointer -> they are mutable
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}

//
//  ContentView.swift
//  Memorise
//
//  Created by Jerry Zhu on 23/9/21.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            title
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]){
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
//            Spacer()
//            HStack {
//                animalTheme
//                Spacer()
//                vehicleTheme
//                Spacer()
//                foodTheme
//            }
//            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding()
    }
      
    var title: some View{
        Text("Memorise!").font(Font.system(size:30))
    }
//
//    var animalTheme: some View {
//        Button (
//            action: {
//                emojis = animalEmojis.shuffled()
//                emojiCount = Int.random(in: 4..<animalEmojis.count)
//            },
//            label: {
//                VStack{
//                    Image(systemName: "tortoise").font(.largeTitle)
//                    Text("Animals").font(.body)
//                }
//            }
//        )
//    }
//
//    var vehicleTheme: some View {
//        Button (
//            action: {
//                emojis = vehicleEmojis.shuffled()
//                emojiCount = Int.random(in: 4..<vehicleEmojis.count)
//            },
//            label: {
//                VStack{
//                    Image(systemName: "car").font(.largeTitle)
//                    Text("Vehicles").font(.body)
//                }
//            }
//        )
//    }
//
//    var foodTheme: some View {
//        Button (
//            action: {
//                emojis = foodEmojis.shuffled()
//                emojiCount = Int.random(in: 4..<foodEmojis.count)
//            },
//            label: {
//                VStack{
//                    Image(systemName: "applelogo").font(.largeTitle)
//                    Text("Food").font(.body)
//                }
//            }
//        )
//    }
    
}
struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched{
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}


// Emojis
//@State var emojis = [ "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵"]
//@State var emojiCount: Int = 4
//
//var vehicleEmojis = ["🚗","🚌","🚑","🚜","🛴","🚲","🚔","🛺","🚘","🚃","🚄","🚠","🚅","✈️","🚀","🛸","🚁","🛶","🚤","🚢","🛳","🚓","🚛","🛵"]
//var animalEmojis = [ "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵"]
//var foodEmojis = [ "🌭", "🍔", "🍟", "🍕", "🫓", "🥪", "🥙", "🧆", "🌮", "🌯", "🫔", "🥗", "🥘", "🫕", "🥫", "🍝", "🍜", "🍲", "🍛", "🍣", "🍱", "🥟", "🦪", "🍤", "🍙", "🍚", "🍘", "🍥", "🥠", "🥮", "🍢", "🍡", "🍧", "🍨", "🍦", "🥧", "🧁", "🍰", "🎂", "🍮", "🍭", "🍬", "🍫", "🍿", "🍩", "🍪", "🌰"]

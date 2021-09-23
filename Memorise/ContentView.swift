//
//  ContentView.swift
//  Memorise
//
//  Created by Jerry Zhu on 23/9/21.
//

import SwiftUI
struct ContentView: View {
    @State var emojis = [ "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵"]
    @State var emojiCount: Int = 4
    
    var vehicleEmojis = ["🚗","🚌","🚑","🚜","🛴","🚲","🚔","🛺","🚘","🚃","🚄","🚠","🚅","✈️","🚀","🛸","🚁","🛶","🚤","🚢","🛳","🚓","🚛","🛵"]
    var animalEmojis = [ "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵"]
    var foodEmojis = [ "🌭", "🍔", "🍟", "🍕", "🫓", "🥪", "🥙", "🧆", "🌮", "🌯", "🫔", "🥗", "🥘", "🫕", "🥫", "🍝", "🍜", "🍲", "🍛", "🍣", "🍱", "🥟", "🦪", "🍤", "🍙", "🍚", "🍘", "🍥", "🥠", "🥮", "🍢", "🍡", "🍧", "🍨", "🍦", "🥧", "🧁", "🍰", "🎂", "🍮", "🍭", "🍬", "🍫", "🍿", "🍩", "🍪", "🌰"]
    
    var body: some View {
        VStack {
            title
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                animalTheme
                Spacer()
                vehicleTheme
                Spacer()
                foodTheme
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding()
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var title: some View{
        Text("Memorise!").font(Font.system(size:30))
    }
    
    var animalTheme: some View {
        Button (
            action: {
                emojis = animalEmojis.shuffled()
                emojiCount = Int.random(in: 4..<animalEmojis.count)
            },
            label: {
                VStack{
                    Image(systemName: "tortoise").font(.largeTitle)
                    Text("Animals").font(.body)
                }
            }
        )
    }
    
    var vehicleTheme: some View {
        Button (
            action: {
                emojis = vehicleEmojis.shuffled()
                emojiCount = Int.random(in: 4..<vehicleEmojis.count)
            },
            label: {
                VStack{
                    Image(systemName: "car").font(.largeTitle)
                    Text("Vehicles").font(.body)
                }
            }
        )
    }
    
    var foodTheme: some View {
        Button (
            action: {
                emojis = foodEmojis.shuffled()
                emojiCount = Int.random(in: 4..<foodEmojis.count)
            },
            label: {
                VStack{
                    Image(systemName: "applelogo").font(.largeTitle)
                    Text("Food").font(.body)
                }
            }
        )
    }
    
}
struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            if isFaceUp == true {
                isFaceUp = false
            } else {
                isFaceUp = true
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}

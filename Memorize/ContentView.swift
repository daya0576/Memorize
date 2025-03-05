//
//  ContentView.swift
//  Memorize
//
//  Created by Henry Zhu on 2025/2/15.
//

import SwiftUI

// Is struct similar to a class?
// No, just have variable and function

// ": View": means behaves like a ...
// must have variable "body"
struct ContentView: View {
    
    let emojis = ["🥰", "🥳", "🥵", "😄", "❌"]
    @State var cardCount = 4
    
    // Computed Property
    // "some" means one of view, similar to View<?> in java
    var body: some View {
        
        // "{}" embedded function -> similar to Java Anonymous Class
        // syntax sugar: Trailing Closure Context
        // VStack(content: { ... })
        VStack {
            cards
            Spacer()
            adjusters
        }

        // scope matters
        .foregroundStyle(.orange)
        .padding()
    }
    
    var cards: some View {
        // Why not return?
        // implicit return
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
    }

    func cardCountAjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1)
        .disabled(cardCount + offset > emojis.count)
    }

    var adjusters: some View {
        HStack {
            cardCountAjuster(by: +1, symbol: "plus.app")
            Spacer()
            cardCountAjuster(by: -1, symbol: "minus.square")
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    
}

struct CardView: View {
    // constructor variable
    let content: String
    // Pointer created
    @State var isFaceUp = true

    var body: some View    {
        ZStack (alignment: .center) {
            let base = RoundedRectangle(cornerRadius: 12)
            base.fill().opacity(isFaceUp ? 0:1)
            
            Group {
                // function (view modifier)
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                
                // .largeTitle is predefined style (css)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1: 0)
            
        }.onTapGesture{
            isFaceUp = !isFaceUp
            print("tapped: \(isFaceUp)")
        }
    }
}

#Preview {
    ContentView()
}

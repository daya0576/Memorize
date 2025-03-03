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
    
    // Computed Property
    // "some" means one of view, similar to View<?> in java
    var body: some View {
        
        // "{}" embedded function -> similar to Java Anonymous Class
        // syntax sugar:
        // VStack(content: { ... })
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }

        // scope matters
        .foregroundStyle(.orange)
        .padding()
    }
}

struct CardView: View {
    // constructor variable
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                // function (view modifier)
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    // .strokeBorder(style: StrokeStyle(lineWidth: 5))
                    .strokeBorder(lineWidth: 5)
                
                // .largeTitle is predefined style (css)
                Text("😋").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}

#Preview {
    ContentView()
}

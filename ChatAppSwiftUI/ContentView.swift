//
//  ContentView.swift
//  ChatAppSwiftUI
//
//  Created by Bahadır Tarcan on 23.08.2023.
//

import SwiftUI

struct ContentView: View {
    var messageArray = ["Hello you", "How are you doing?", "I've been building SwiftUI applications from scratch and it's so mych fun!"]
    
    var body: some View {
        VStack {
            VStack {
               TitleRow()
                
                ScrollView {
                    ForEach(messageArray, id: \.self) { text in
                        MessageBubble(message: Message(id: "12345", text: text, received: true, timestamp: Date()))
                    }
                }
                .padding(.top, 10)
                .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .background(Color(hex: "FFE5B4"))
            
            MessageField()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

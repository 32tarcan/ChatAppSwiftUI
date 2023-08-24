//
//  ChatModel.swift
//  ChatAppSwiftUI
//
//  Created by Bahadır Tarcan on 24.08.2023.
//

import Foundation

class ChatModel: ObservableObject {
    @Published var messages: [Message] = []
    
    let possibleReplies = [
        "Merhaba!",
        "Nasılsınız?",
        "Ne haber?",
        "Evet",
        "Hayır",
        "Anladım",
        "Bu ilginç.",
        "Devam et...",
    ]
    
    func addMessage(_ message: String) {
        let userMessage = Message(content: message, isUser: true)
        messages.append(userMessage)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let randomIndex = Int.random(in: 0..<self.possibleReplies.count)
            let randomReply = self.possibleReplies[randomIndex]
            let botMessage = Message(content: randomReply, isUser: false)
            self.messages.append(botMessage)
        }
    }
}

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
                   
                   let userMessage = Message(content: message, isUser: true)
                   
                   
                   self.saveMessagesToUserDefaults()
            
            
        }
    }
    
  
        
        private func saveMessagesToUserDefaults() {
            do {
                let encodedMessages = try JSONEncoder().encode(messages)
                UserDefaults.standard.set(encodedMessages, forKey: "messages")
            } catch {
                print("Error saving messages to UserDefaults: \(error)")
            }
        }
        
        private func loadMessagesFromUserDefaults() {
            if let encodedMessages = UserDefaults.standard.data(forKey: "messages") {
                do {
                    let decodedMessages = try JSONDecoder().decode([Message].self, from: encodedMessages)
                    messages = decodedMessages
                } catch {
                    print("Error loading messages from UserDefaults: \(error)")
                }
            }
        }
        
        init() {
            loadMessagesFromUserDefaults()
        }
    }
    







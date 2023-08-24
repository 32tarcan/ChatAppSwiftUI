//
//  MessageBubble.swift
//  ChatAppSwiftUI
//
//  Created by Bahadır Tarcan on 23.08.2023.
//

//import SwiftUI
//
//struct MessageBubble: View {
//    var message: Message
//    @State private var showTime = false
//    
//    @State private var botResponse: String = ""
//    
//    var body: some View {
//        VStack(alignment: message.isUser ? .leading : .trailing) {
//            HStack {
//                Text(message.content)
//                    .padding()
//                    .background(message.isUser ?
//                                Color(hex: "F5F5F5") : Color(hex: "FFD8C4"))
//                    .cornerRadius(30)
//            }
//            .frame(maxWidth: 300, alignment: message.isUser ? .leading : .trailing)
//            .onTapGesture {
//                showTime.toggle()
//            }
//            
//        }
//        .frame(maxWidth: .infinity, alignment: message.isUser ? .leading : .trailing)
//        .padding(message.isUser ? .leading : .trailing)
//        .padding(.horizontal, 10)
//        
//        
//        if !botResponse.isEmpty && !message.isUser {
//            HStack {
//                Spacer()
//                Text(botResponse)
//                    .padding()
//                    .background(Color(hex: "F5F5F5"))
//                    .cornerRadius(30)
//            }
//            .frame(maxWidth: 300, alignment: .trailing)
//            .padding(.top, 5)
//        }
//    }
//}



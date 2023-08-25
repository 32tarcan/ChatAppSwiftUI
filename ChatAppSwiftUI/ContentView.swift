//
//  ContentView.swift
//  ChatAppSwiftUI
//
//  Created by Bahadır Tarcan on 23.08.2023.
//

import SwiftUI


struct ContentView: View {
    @StateObject private var chatModel = ChatModel()
    @State private var newMessage = ""
    
    var body: some View {
        
        VStack {
            
            TitleRow()
                .background(Color(hex: "FFE5B4"))
            
            ScrollViewReader { scrollViewProxy in
                ScrollView {
                    ForEach(chatModel.messages) { message in
                        MessageView(content: message.content, isUser: message.isUser)
                            .id(message.id)
                    }
                    .onChange(of: chatModel.messages) { _ in
                        
                        withAnimation {
                            scrollViewProxy.scrollTo(chatModel.messages.last?.id, anchor: .bottom)
                        }
                    }
                }
                
            }
            .padding(.top, 20)
            .background(.white)
            .cornerRadius(30, corners: [.topLeft, .topRight])
        
            
            HStack {
                TextField("Enter your message here", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button {
                    chatModel.addMessage(newMessage)
                    newMessage = ""
                } label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color(hex: "FFD8C4"))
                        .cornerRadius(50)
                }
                
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color(hex: "F5F5F5"))
            .cornerRadius(50)
            .padding()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}



struct MessageView: View {
    let content: String
    let isUser: Bool
    
    var body: some View {
        HStack {
            if isUser {
                Spacer()
                Text(content)
                    .padding()
                    .background(Color(hex: "FFD8C4"))
                    .cornerRadius(10)
                
            } else {
                Text(content)
                    .padding()
                    .background(Color(hex: "F5F5F5"))
                    .cornerRadius(10)
                
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

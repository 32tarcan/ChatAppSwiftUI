//
//  Message.swift
//  ChatAppSwiftUI
//
//  Created by Bahadır Tarcan on 23.08.2023.
//

import Foundation
struct Message: Identifiable {
    let id = UUID()
    let content: String
    let isUser: Bool
}

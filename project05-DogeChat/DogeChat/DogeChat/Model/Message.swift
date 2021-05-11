//
//  Message.swift
//  SocketIODogeChat
//
//  Created by 박성민 on 2021/05/06.
//

import Foundation

struct Message {
    let message: String
    let senderUsername: String
    let messageSender: MessageSender
    
    init(message: String, messageSender: MessageSender, username: String) {
        self.message = message.withoutWhitespace()
        self.messageSender = messageSender
        self.senderUsername = username
    }
}

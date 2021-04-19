//
//  ToDoItem.swift
//  project04-TodoTDD
//
//  Created by 박성민 on 2021/04/08.
//

import Foundation

struct ToDoItem {
    let title: String
    let description: String?
    let timeStamp: Date
    var isDone: Bool

    init(title: String, description: String? = nil, timeStamp: Date = Date(), isDone: Bool = false) {
        self.title = title
        self.description = description
        self.timeStamp = timeStamp
        self.isDone = isDone

    }
    
}

extension ToDoItem: Equatable {
    static func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        return lhs.title == rhs.title
            && lhs.description == rhs.description
            && lhs.timeStamp == rhs.timeStamp
            && lhs.isDone == rhs.isDone
    }
}

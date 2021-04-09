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
    let timeStamp: Date?
    let location: Location?
    
    init(title: String, description: String? = nil, timeStamp: Date? = nil, location: Location? = nil) {
        self.title = title
        self.description = description
        self.timeStamp = timeStamp
        self.location = location
    }
    
}

extension ToDoItem: Equatable {
    static func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        return lhs.title == rhs.title && lhs.location?.name == rhs.location?.name && lhs.timeStamp == rhs.timeStamp
    }
}

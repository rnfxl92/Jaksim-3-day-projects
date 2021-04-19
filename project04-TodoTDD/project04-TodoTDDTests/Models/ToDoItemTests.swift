//
//  ToDoItemTests.swift
//  project04-TodoTDDTests
//
//  Created by 박성민 on 2021/04/08.
//

import XCTest

class ToDoItemTests: XCTestCase {
    let titleName = "TitleName"
    
    func test_init_Title() {
        let toDoItem = ToDoItem(title: titleName)
        XCTAssertEqual(toDoItem.title, titleName)
    }

    func test_init_Description() {
        let itemDescription = "Description"
        let toDoItem = ToDoItem(title: titleName, description: itemDescription)
        
        XCTAssertEqual(toDoItem.description, itemDescription)
        
    }
    
    func test_init_TimeStamp() {
        let timeStamp = Date()
        let toDoItem = ToDoItem(title: titleName, timeStamp: timeStamp)
        
        XCTAssertEqual(toDoItem.timeStamp, timeStamp)
    }
    
    func test_init_isDone() {
        
        let toDoItem = ToDoItem(title: titleName, isDone: true)
        
        XCTAssertEqual(toDoItem.isDone, true)
        
    }
        
}

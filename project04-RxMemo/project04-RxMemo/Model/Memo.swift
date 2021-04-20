//
//  Memo.swift
//  project04-RxMemo
//
//  Created by 박성민 on 2021/04/20.
//

import Foundation
import CoreData
import RxCoreData
import RxDataSources

struct Memo: Equatable, IdentifiableType {
    var title: String
    var contents: String
    var date: Date
    var isDone: Bool
    var identity: String
    
    init(title: String, contents: String, date: Date = Date(), isDone: Bool = false) {
        self.title = title
        self.contents = contents
        self.date = date
        self.isDone = isDone
        self.identity = "\(title), \(contents), \(date.timeIntervalSinceReferenceDate), \(isDone)"
    }
    
    static func == (lhs: Memo, rhs: Memo) -> Bool {
        return lhs.identity == rhs.identity
    }
    
}

extension Memo: Persistable {
    
    
    public static var entityName: String {
        return "Memo"
    }
    
    static var primaryAttributeName: String {
        return "identity"
    }
    
    init(entity: NSManagedObject) {
        title = entity.value(forKey: "title") as! String
        contents = entity.value(forKey: "contents") as! String
        date = entity.value(forKey: "date") as! Date
        isDone = entity.value(forKey: "isDone") as! Bool
        identity = "\(title), \(contents), \(date.timeIntervalSinceReferenceDate), \(isDone)"
    }
    
    func update(_ entity: NSManagedObject) {
        entity.setValue(title, forKey: "title")
        entity.setValue(contents, forKey: "contents")
    }
    
}

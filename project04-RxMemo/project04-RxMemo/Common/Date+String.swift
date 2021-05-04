//
//  Date+String.swift
//  project04-RxMemo
//
//  Created by 박성민 on 2021/05/03.
//

import Foundation

extension Date {
    
    func getString() -> String {
        let formatter: DateFormatter = {
            let f = DateFormatter()
            f.locale = Locale(identifier: "Ko_kr")
            f.dateStyle = .medium
            f.timeStyle = .medium
            return f
        }()
        
        return formatter.string(from: self)
    }
}

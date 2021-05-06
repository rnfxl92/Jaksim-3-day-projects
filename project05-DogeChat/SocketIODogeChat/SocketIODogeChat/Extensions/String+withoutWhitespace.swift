//
//  String+withoutWhitespace.swift
//  SocketIODogeChat
//
//  Created by 박성민 on 2021/05/06.
//

import Foundation

extension String {
    func withoutWhitespace() -> String {
        return self.replacingOccurrences(of: "\n", with: "")
            .replacingOccurrences(of: "\r", with: "")
            .replacingOccurrences(of: "\0", with: "")
    }
}

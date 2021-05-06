//
//  ChatLabel.swift
//  SocketIODogeChat
//
//  Created by 박성민 on 2021/05/06.
//

import UIKit

class ChatLabel: UILabel {
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: 8, left: 16, bottom: 8, right: 16)
        super.drawText(in: rect.inset(by: insets))
    }
}

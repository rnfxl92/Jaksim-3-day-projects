//
//  TransitionModel.swift
//  RxMemo
//
//  Created by 박성민 on 2021/01/24.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}

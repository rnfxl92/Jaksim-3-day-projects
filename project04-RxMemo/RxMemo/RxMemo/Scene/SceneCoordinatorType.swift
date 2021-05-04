//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by 박성민 on 2021/01/24.
//

import Foundation
import RxSwift

protocol  SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable
}

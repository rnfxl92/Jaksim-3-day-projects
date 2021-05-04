//
//  SceneController.swift
//  project04-RxMemo
//
//  Created by 박성민 on 2021/05/02.
//

import Foundation
import RxSwift
import RxCocoa

extension UIViewController {
    var sceneViewController: UIViewController {
        return self.children.first ?? self
    }
}

class SceneCoordinator: SceneCoordinatorType {
    private let bag = DisposeBag()
    private var window: UIWindow
    private var currentVC: UIViewController
    
    required init(window: UIWindow) {
        self.window = window
        currentVC = window.rootViewController!
    }
    
    
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable {
        let subject = PublishSubject<Void>()
        //let target = scene.instantiate()
    }
    
    @discardableResult
    func close(animated: Bool) -> Completable {
        <#code#>
    }
    
    
}

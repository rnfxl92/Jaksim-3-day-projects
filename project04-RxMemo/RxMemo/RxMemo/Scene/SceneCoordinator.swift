//
//  SceneCoordinator.swift
//  RxMemo
//
//  Created by 박성민 on 2021/01/24.
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
    private var currnetVC: UIViewController
    
    required init(window: UIWindow) {
        self.window = window
        currnetVC = window.rootViewController!
    }
    
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable {
        let subject = PublishSubject<Void>()
        
        let target = scene.instantiate()
        
        switch style {
        case .root:
            currnetVC = target.sceneViewController
            window.rootViewController = target
            subject.onCompleted()
        case .push:
            print(currnetVC)
            guard let nav = currnetVC.navigationController else {
                subject.onError(TransitionError.navigationControllerMissing)
                break
            }
            
            nav.rx.willShow
                .subscribe(onNext: {[unowned self] evt in
                    self.currnetVC = evt.viewController.sceneViewController
                })
                .disposed(by: bag)
            
            nav.pushViewController(target, animated: animated)
            currnetVC = target.sceneViewController
            
            subject.onCompleted()
            
        case .modal:
            currnetVC.present(target, animated: animated) {
                subject.onCompleted()
            }
            currnetVC = target.sceneViewController
        }
        
        return subject.ignoreElements()
        
    }
    
    @discardableResult
    func close(animated: Bool) -> Completable {
        return Completable.create { [unowned self] completable in
            if let presentingVC = self.currnetVC.presentingViewController {
                self.currnetVC.dismiss(animated: animated) {
                    self.currnetVC = presentingVC.sceneViewController
                    completable(.completed)
                }
            } else if let nav = self.currnetVC.navigationController {
                guard nav.popViewController(animated: animated) != nil else {
                    completable(.error(TransitionError.cannotPop))
                    return Disposables.create()
                }
                self.currnetVC = nav.viewControllers.last!
            } else {
                completable(.error(TransitionError.unknown))
            }
            return Disposables.create()
        }
    }
}

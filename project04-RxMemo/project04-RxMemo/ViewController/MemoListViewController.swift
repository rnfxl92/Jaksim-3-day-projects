//
//  ViewController.swift
//  project04-RxMemo
//
//  Created by 박성민 on 2021/04/19.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class MemoListViewController: UIViewController,ViewModelBindableType {
    var viewModel: MemoListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func bindViewModel() {
        
    }

}


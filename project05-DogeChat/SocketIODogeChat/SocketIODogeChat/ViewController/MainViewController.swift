//
//  MainViewController.swift
//  SocketIODogeChat
//
//  Created by 박성민 on 2021/05/05.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }

    @IBAction func joinButtonDidTap(_ sender: Any) {
    }
    
    func chatRoomView() {
        
    }
    
    
}

extension MainViewController: UITextFieldDelegate {
    
}

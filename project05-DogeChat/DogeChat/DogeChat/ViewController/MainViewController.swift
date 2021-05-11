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
        pushChatRoomView()
    }
    
    func pushChatRoomView() {
        guard let chatRoomVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "chatRoomVC") as? ChatRoomViewController else {
            return
        }
        if let username = nameTextField.text {
            chatRoomVC.username = username
        }
        navigationController?.pushViewController(chatRoomVC, animated: true)
    }
    
}

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushChatRoomView()
        return true
    }
}

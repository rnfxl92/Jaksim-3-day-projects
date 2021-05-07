//
//  ChatRoomViewController.swift
//  SocketIODogeChat
//
//  Created by 박성민 on 2021/05/06.
//

import UIKit

class ChatRoomViewController: UIViewController {
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var chatTextField: UITextField!
    var username = ""
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func chatButtonDidTap(_ sender: Any) {
    }
    
}

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
        chatTableView.delegate = self
        chatTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func chatButtonDidTap(_ sender: Any) {
    }
    
}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatTableViewCell(style: .default, reuseIdentifier: "ChatCell")
        cell.selectionStyle = .none
        
        let message = messages[indexPath.row]
        cell.apply(message: message)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = ChatTableViewCell.height(for: messages[indexPath.row])
        
        return height
    }
    
    func insertNewMessageCell(_ message: Message) {
        messages.append(message)
        let indexPath = IndexPath(row: messages.count-1, section: 0)
        chatTableView.beginUpdates()
        chatTableView.insertRows(at: [indexPath], with: .bottom)
        chatTableView.endUpdates()
        chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
}

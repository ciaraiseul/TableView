//
//  ViewController.swift
//  TableView
//
//  Created by Phạm Trường Giang on 12/09/2024.
//

import UIKit

struct Conversation {
    var avatarImage: String
    var name: String
    var lastMessage: String
    var date: String
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let conversations: [Conversation] = [
            Conversation(avatarImage: "hinh1", name: "Pao Quán", lastMessage: "Tin nhắn 1", date: "16/01"),
            Conversation(avatarImage: "hinh2", name: "Cộng đồng Cờ Vua", lastMessage: "Tin nhắn 2", date: "12/01"),
            Conversation(avatarImage: "hinh3", name: "Tô Lâm", lastMessage: "Tin nhắn 3", date: "10/01"),
            Conversation(avatarImage: "hinh4", name: "Vũ Xuân Phúc", lastMessage: "Tin nhắn 4", date: "09/01"),
            Conversation(avatarImage: "hinh5", name: "Trần Đại Quang", lastMessage: "Tin nhắn 5", date: "09/01"),
            Conversation(avatarImage: "hinh6", name: "Linh Mai", lastMessage: "Tin nhắn 6", date: "06/01"),
            Conversation(avatarImage: "hinh7", name: "Lê Thành Nam", lastMessage: "Tin nhắn 7", date: "06/01"),
            Conversation(avatarImage: "hinh8", name: "Đỗ Lâm Lâm", lastMessage: "Tin nhắn 8", date: "04/01"),
            Conversation(avatarImage: "hinh9", name: "Phương Ly", lastMessage: "Tin nhắn 9", date: "31/12"),
            Conversation(avatarImage: "hinh10", name: "Bánh Bao", lastMessage: "Tin nhắn 10", date: "29/12")
        ]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ConversationCell")
            tableView.separatorStyle = .singleLine
        }
    }

    extension ViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("Selected conversation: \(conversations[indexPath.row].name)")
        }
    }

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let conversation = conversations[indexPath.row]
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ConversationCell")
        
        if let image = UIImage(named: conversation.avatarImage) {
            cell.imageView?.image = image
            
            let itemSize = CGSize(width: 50, height: 50)
            UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.main.scale)
            let imageRect = CGRect(origin: CGPoint.zero, size: itemSize)
            image.draw(in: imageRect)
            cell.imageView?.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        
        cell.textLabel?.text = conversation.name
        cell.detailTextLabel?.text = conversation.lastMessage
        
        let labelWidth: CGFloat = 50
        let paddingRight: CGFloat = 15
        let dateLabel = UILabel(frame: CGRect(x: cell.contentView.frame.width - labelWidth - paddingRight, y: 10, width: labelWidth, height: 30))
        dateLabel.text = conversation.date
        dateLabel.textAlignment = .right
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.autoresizingMask = [.flexibleLeftMargin]
        cell.contentView.addSubview(dateLabel)
        
        
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.layer.cornerRadius = 25
        cell.imageView?.clipsToBounds = true
        cell.imageView?.frame = CGRect(x: 10, y: 15, width: 50, height: 50)
        
        return cell
    }
}




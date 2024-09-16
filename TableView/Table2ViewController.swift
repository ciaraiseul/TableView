//
//  Table2ViewController.swift
//  TableView
//
//  Created by Phạm Trường Giang on 12/09/2024.
//

import UIKit

class Table2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let sections: [String] = ["", "Bảo mật", ""]
    let settings: [[String]] = [
        ["Bảo mật tài khoản", "", "Chế độ người giám hộ", "Chế độ Đơn giản", "", "Thông báo tin nhắn", "Trò chuyện", "Chung"],
        ["Quyền của bạn bè", "Thông tin & ủy quyền của tôi", "", "Về", "Trợ giúp & Phản hồi"],
        ["", "Chuyển đổi tài khoản", "", "Đăng xuất"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.separatorColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)
    }

    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let headerView = UIView()
            headerView.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)

            let titleLabel = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.frame.width, height: 40))
            titleLabel.text = sections[section]
            titleLabel.textColor = .gray
            titleLabel.font = UIFont.systemFont(ofSize: 16)

            headerView.addSubview(titleLabel)
            return headerView
        }
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 40
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.section == 0 && (indexPath.row == 1 || indexPath.row == 4) {
            cell.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)
            cell.textLabel?.text = ""
        } else if indexPath.section == 1 && indexPath.row == 2 {
            cell.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)
            cell.textLabel?.text = ""
        } else if indexPath.section == 2 && (indexPath.row == 0 || indexPath.row == 2) {
            cell.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)
            cell.textLabel?.text = ""
        } else {
            cell.textLabel?.text = settings[indexPath.section][indexPath.row]
            cell.backgroundColor = UIColor(red: 253/255, green: 253/255, blue: 253/255, alpha: 1.0)

            if indexPath.section == 2 && (indexPath.row == 1 || indexPath.row == 3) {
                cell.textLabel?.textAlignment = .center
                cell.accessoryType = .none
            } else {
                cell.accessoryType = .disclosureIndicator
                cell.textLabel?.textAlignment = .left
            }

            cell.textLabel?.font = UIFont.systemFont(ofSize: 18)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && (indexPath.row == 1 || indexPath.row == 4) {
            return 10
        } else if indexPath.section == 1 && indexPath.row == 2 {
            return 10
        } else if indexPath.section == 2 && (indexPath.row == 0 || indexPath.row == 2) {
            return 10
        }
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped on: \(settings[indexPath.section][indexPath.row])")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

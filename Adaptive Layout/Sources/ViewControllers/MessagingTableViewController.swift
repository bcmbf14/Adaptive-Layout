//
//  ViewController.swift
//  Adaptive Layout
//
//  Created by jc.kim on 2/22/21.
//


import UIKit




class MessagingTableViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageField: UITextView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var sendButton: UIButton!
    
    private var chats: [Chat] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTable()
        configureUI()
        configureNavigationBar()
        addNotification()
        
    }
    

    @IBAction func sendMessage() {
        guard let text = messageField.text else { return }
        
        chats.append(Chat(message: text))
        messageField.text = nil
        
        let indexPath = IndexPath(row: chats.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.none)
        
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    
    func configureUI() {
        messageField.layer.cornerRadius = 8
        sendButton.layer.cornerRadius = 8
    }
    
    
    func configureTable() {
        tableView.register(UINib(nibName: "LeftMessageTableViewCell", bundle: nil), forCellReuseIdentifier: LeftMessageTableViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: "RightMessageTableViewCell", bundle: nil), forCellReuseIdentifier: RightMessageTableViewCell.reuseIdentifier)
        tableView.dataSource = self
    }
    
    func configureNavigationBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .close)
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(systemItem: .action),
            UIBarButtonItem(systemItem: .compose)
        ]
    }
    
    func addNotification() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
            guard let userInfo = notification.userInfo,
                  let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
                  let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }

            self.bottomConstraint.constant = keyboardFrame.height + 8
            
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
            guard let userInfo = notification.userInfo,
                  let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
            
            self.bottomConstraint.constant = 8
            
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
            
        }
    }

}

extension MessagingTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let chat = chats[indexPath.row]
        let identifier = chat.isMyMessage ? "LeftMessageTableViewCell" : "RightMessageTableViewCell"
        
        switch identifier {
        case "LeftMessageTableViewCell" :
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! LeftMessageTableViewCell
            cell.chatLabel.text = chat.message
            cell.callback = { [weak self] in
                let storyboard = UIStoryboard(name: "Profile", bundle: nil)
                guard let vc = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else { return }
                self?.present(vc, animated: true, completion: nil)
            }
            return cell
        case "RightMessageTableViewCell" :
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! RightMessageTableViewCell
            cell.chatLabel.text = chat.message
            cell.callback = { [weak self] in
                let storyboard = UIStoryboard(name: "Profile", bundle: nil)
                guard let vc = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else { return }
                self?.present(vc, animated: true, completion: nil)
            }
            return cell
        default:
            break
        }

        return UITableViewCell()
    }
    
}


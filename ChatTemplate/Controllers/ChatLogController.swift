//
//  ChatLogController.swift
//  RocketChat
//
//  Created by Bibin Jacob Pulickal on 28/08/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

class ChatLogController: UITableViewController {
    
    // MARK: - Variables
    
    private let reuseIdentifier = "\(ChatLogController.self)"
    
    var userViewModel: UserViewModel? {
        didSet {
            self.navigationItem.titleView = NavigationBarView(userViewModel: userViewModel)
        }
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadAndScrollToEnd()
        addKeyboardObservers()
    }
    
    // MARK: - Setup Views
    
    private func setupTableView() {
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.keyboardDismissMode = .interactive
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        tableView.register(MessageCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: - Table View Functions
    
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(scrollToEnd), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    private func reloadAndScrollToEnd() {
        UIView.animate(withDuration: 0, animations: {
            self.tableView.reloadData()
        }) { (_) in
            self.scrollToEnd()
        }
    }
    
    @objc private func scrollToEnd() {
        if tableView.numberOfRows(inSection: 0) > 0 {
            let lastIndexPath = IndexPath(row: tableView.numberOfRows(inSection: 0) - 1, section: 0)
            tableView.scrollToRow(at: lastIndexPath, at: .top, animated: true)
        }
    }
    
    // MARK: - Setup Keyboard
    
    lazy var inputContainerView = InputAccessoryView(delegate: self, height: tabBarController?.tabBar.frame.height)
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var inputAccessoryView: UIView? {
        return inputContainerView
    }
    
    // MARK: - Table View Data Source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MessageCell
        cell.messageViewModel = MessageViewModel(text: messages[indexPath.row], time: dateFormatter.string(from: randomTime()), isIncoming: Bool.random())
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    // MARK: - Deinitializers
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension ChatLogController: InputAccessoryViewDelegate {
    
    func send(text: String) {
        
        messages.append(text)
        reloadAndScrollToEnd()
    }
}

//
//  MessagesController.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 23/08/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

class MessagesController: UITableViewController {
    
    // MARK: - Variables
    
    private let reuseIdentifier = "\(MessagesController.self)"
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
    }
    
    // MARK: - Setup Views
    
    private func setupTableView() {
        tableView.backgroundColor = ThemeManager.current.backgroundColor
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Messages"
        navigationItem.titleView = NavigationBarView(userViewModel: randomUserViewModel, showStatus: false)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showChatLogController()
        if let cell = tableView.cellForRow(at: indexPath) as? UserCell {
            set(theme: ThemeManager.inverted, for: cell)
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? UserCell {
            set(theme: ThemeManager.current, for: cell)
        }
    }
    
    private func showChatLogController() {
        let chatLogController = ChatLogController()
        chatLogController.userViewModel = randomUserViewModel
        let chatNavigationController = UINavigationController(rootViewController: chatLogController)
        navigationController?.splitViewController?.showDetailViewController(chatNavigationController, sender: nil)
    }
    
    private func set(theme: Theme, for cell: UserCell) {
        cell.nameLabel.textColor = theme.titleTextColor
        cell.timeLabel.textColor = theme.subtitleTextColor
        cell.detailLabel.textColor = theme.subtitleTextColor
        cell.messageCountLabel.backgroundColor = .green
    }
    
    // MARK: - Table View Data Source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell
        cell.userViewModel = randomUserViewModel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 32
    }
}


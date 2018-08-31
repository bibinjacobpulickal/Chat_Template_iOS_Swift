//
//  MessagesController.swift
//  RocketChat
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
        
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Setup Views
    
    private func setupNavigationBar() {
        navigationItem.title = "Messages"
        navigationItem.titleView = NavigationBarView(userViewModel: randomUserViewModel)
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatLogController = ChatLogController()
        chatLogController.userViewModel = randomUserViewModel
        navigationController?.pushViewController(chatLogController, animated: true)
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
}


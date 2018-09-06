//
//  NavigationBarView.swift
//  FirebaseChat
//
//  Created by Bibin Jacob Pulickal on 23/04/2018.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

class NavigationBarView: UIButton {
    
    // MARK: - Views
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 20
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    // MARK: - Initializers
    
    init(userViewModel: UserViewModel?, showStatus: Bool) {
        super.init(frame: .zero)
        
        set(userViewModel: userViewModel)
        setupViews(showStatus: showStatus)
    }
    
    // MARK: - Setup Views
    
    private func set(userViewModel: UserViewModel?) {
        
        if let name = userViewModel?.name?.components(separatedBy: " ")[0] {
            nameLabel.text = name
            statusLabel.text = userViewModel?.status
            profileImageView.loadCachedImage(from: userViewModel?.profileImageUrl)
        }
    }
    
    private func setupViews(showStatus: Bool) {
        addView(nameLabel, anchors: [.top])
        addView(profileImageView, anchors: [.centerY], trailing: nameLabel.leadingAnchor, padding: UIEdgeInsets(trailing: 8), size: CGSize(width: 40, height: 40))
        if showStatus {
            addView(statusLabel, top: nameLabel.bottomAnchor, leading: nameLabel.leadingAnchor)
        } else {
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

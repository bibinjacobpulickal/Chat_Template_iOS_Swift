//
//  UserCell.swift
//  FirebaseChat
//
//  Created by Bibin Jacob Pulickal on 18/04/2018.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    // MARK: - Variables
    
    var userViewModel: UserViewModel? {
        didSet {
            nameLabel.text = userViewModel?.name
            timeLabel.text = userViewModel?.lastMessageTimeAgo
            if Bool.random() {
                messageCountLabel.isHidden = true
            } else {
                messageCountLabel.isHidden = false
                messageCountLabel.text = userViewModel?.newMessageCount
            }
            detailLabel.text = userViewModel?.lastMessage
            profileImageView.loadCachedImage(from: userViewModel?.profileImageUrl)
        }
    }
    
    // MARK: - Views
    
    let profileImageView: UIImageView = create {
        $0.layer.cornerRadius = 32
        $0.layer.masksToBounds = true
    }
    
    let nameLabel: UILabel = create {
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.textColor = ThemeManager.current.titleTextColor
    }
    
    let detailLabel: UILabel = create {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = ThemeManager.current.subtitleTextColor
    }
    
    let timeLabel: UILabel = create {
        $0.textColor = ThemeManager.current.subtitleTextColor
        $0.textAlignment = .right
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    let messageCountLabel: UILabel = create {
        $0.backgroundColor = .green
        $0.textColor = .white
        $0.textAlignment = .center
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
    }
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        
        separatorInset = UIEdgeInsets(left: 96)
        backgroundColor = ThemeManager.current.backgroundColor
        
        addView(profileImageView, anchors: [.top, .bottom, .leading], padding: UIEdgeInsets(top: 4, leading: 16, bottom: 4), size: CGSize(width: 64, height: 64))
        
        addView(timeLabel, anchors: [.top, .trailing], padding: UIEdgeInsets(top: 10, trailing: 8), size: CGSize(height: 20))
        
        addView(nameLabel, top: topAnchor, leading: profileImageView.trailingAnchor, trailing: timeLabel.leadingAnchor, padding: UIEdgeInsets(top: 10, leading: 16, trailing: 8), size: CGSize(height: 20))
        
        addView(messageCountLabel, top: timeLabel.bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 4, bottom: 4, trailing: 8), size: CGSize(height: 24))
        
        addView(detailLabel, top: nameLabel.bottomAnchor, leading: nameLabel.leadingAnchor, bottom: bottomAnchor, padding: UIEdgeInsets(top: 4, bottom: 4, trailing: 8))
        
        messageCountLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 24).isActive = true
        detailLabel.trailingAnchor.constraint(lessThanOrEqualTo: messageCountLabel.leadingAnchor, constant: -8).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

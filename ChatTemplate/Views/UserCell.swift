//
//  UserCell.swift
//  FirebaseChat
//
//  Created by Bibin Jacob Pulickal on 18/04/2018.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    var userViewModel: UserViewModel? {
        didSet {
            nameLabel.text = userViewModel?.name
            timeLabel.text = userViewModel?.lastMessageTime
            if Bool.random() {
                messageCountLabel.isHidden = true
            } else {
                messageCountLabel.isHidden = false
                messageCountLabel.text = userViewModel?.newMessageCount
            }
            detailLabel.text = userViewModel?.lastMessage
            profileImageView.loadImageFrom(urlString: userViewModel?.profileImageUrl)
        }
    }
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 32
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let messageCountLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    private func setupViews() {
        
        separatorInset = UIEdgeInsets(top: 0, left: 96, bottom: 0, right: 0)
        
        addView(profileImageView, anchors: [.top, .bottom, .leading], padding: UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 0), size: CGSize(width: 64, height: 64))
        
        addView(timeLabel, anchors: [.top, .trailing], padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 8), size: CGSize(width: 100, height: 20))
        
        addView(nameLabel, top: topAnchor, leading: profileImageView.trailingAnchor, bottom: nil, trailing: timeLabel.leadingAnchor, padding: UIEdgeInsets(top: 10, left: 16, bottom: 0, right: 8), size: CGSize(width: 0, height: 20))
        
        addView(messageCountLabel, top: timeLabel.bottomAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 8), size: CGSize(width: 0, height: 24))
        
        addView(detailLabel, top: nameLabel.bottomAnchor, leading: nameLabel.leadingAnchor, bottom: bottomAnchor, padding: UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 8))
        
        messageCountLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 24).isActive = true
        detailLabel.trailingAnchor.constraint(lessThanOrEqualTo: messageCountLabel.leadingAnchor, constant: -8).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

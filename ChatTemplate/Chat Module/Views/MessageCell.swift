//
//  MessageCell.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 28/08/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    // MARK: - Variables
    
    var messageViewModel: MessageViewModel? {
        didSet {
            timeLabel.text = messageViewModel?.time
            messageLabel.text = messageViewModel?.text
            if let isIncoming = messageViewModel?.isIncoming {
                let incomingColor = ThemeManager.current.backgroundColor
                let outGoingColor = ThemeManager.current.secondaryColor
                containerView.backgroundColor = isIncoming ? incomingColor : outGoingColor
                setLeadingOrTrailingConstraint(isIncoming: isIncoming)
            }
        }
    }
    
    // MARK: - Views
    
    let containerView: UIView = create {
        $0.backgroundColor = .green
        $0.layer.cornerRadius = 8
    }
    
    let messageLabel: UILabel = create {
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = ThemeManager.current.titleTextColor
    }
    
    let timeLabel: UILabel = create {
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = ThemeManager.current.subtitleTextColor
    }
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        setupViews()
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        addView(containerView, anchors: [.top, .bottom], padding: UIEdgeInsets(top: 8, bottom: 8))
        addView(messageLabel, anchors: [.top, .bottom], padding: UIEdgeInsets(top: 16, bottom: 36))
        addView(timeLabel, anchors: [.bottom], top: messageLabel.bottomAnchor, trailing: messageLabel.trailingAnchor, padding: UIEdgeInsets(top: 4, bottom: 20), size: CGSize(height: 12))
        
        let maximumWidth = UIScreen.main.bounds.width * 2/3
        let minimumWidth: CGFloat = 52
        messageLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: minimumWidth).isActive = true
        messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: maximumWidth - 32).isActive = true
        
        containerView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -8).isActive = true
        containerView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 8).isActive = true
    }
    
    var leadingAnchorConstraint: NSLayoutConstraint?
    var trailingAnchorConstraint: NSLayoutConstraint?
    
    private func setLeadingOrTrailingConstraint(isIncoming: Bool) {
        leadingAnchorConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        trailingAnchorConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        if isIncoming {
            leadingAnchorConstraint?.isActive = true
            trailingAnchorConstraint?.isActive = false
        } else {
            trailingAnchorConstraint?.isActive = true
            leadingAnchorConstraint?.isActive = false
        }
    }
    
    // MARK: - Prepare Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()

        leadingAnchorConstraint?.isActive = false
        trailingAnchorConstraint?.isActive = false

        leadingAnchorConstraint = nil
        trailingAnchorConstraint = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

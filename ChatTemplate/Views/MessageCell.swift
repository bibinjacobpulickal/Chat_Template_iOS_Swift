//
//  MessageCell.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 28/08/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    var messageViewModel: MessageViewModel? {
        didSet {
            timeLabel.text = messageViewModel?.time
            messageLabel.text = messageViewModel?.text
            if let isIncoming = messageViewModel?.isIncoming {
                containerView.backgroundColor = isIncoming ? .white : .green
                setLeadingOrTrailingConstraint(isIncoming: isIncoming)
            }
        }
    }
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 8
        return view
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        addView(containerView, anchors: [.top, .bottom], padding: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
        addView(messageLabel, anchors: [.top, .bottom], padding: UIEdgeInsets(top: 16, left: 0, bottom: 36, right: 0))
        addView(timeLabel, anchors: [.bottom], top: messageLabel.bottomAnchor, trailing: messageLabel.trailingAnchor, padding: UIEdgeInsets(top: 4, left: 0, bottom: 20, right: 0), size: CGSize(width: 0, height: 12))
        
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

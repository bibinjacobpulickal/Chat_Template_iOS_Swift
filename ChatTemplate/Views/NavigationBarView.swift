//
//  NavigationBarView.swift
//  FirebaseChat
//
//  Created by Bibin Jacob Pulickal on 23/04/2018.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

class NavigationBarView: UIButton {
    
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
    
    init(userViewModel: UserViewModel?) {
        super.init(frame: .zero)
        
        setupViews(for: userViewModel)
    }
    
    func setupViews(for userViewModel: UserViewModel?) {
        
        if let name = userViewModel?.name?.components(separatedBy: " ")[0] {
            
            nameLabel.text = name
            profileImageView.loadImageFromCache(userViewModel?.profileImageUrl)
            
            let width = NSString(string: name).size(withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]).width + 8
            addView(nameLabel, anchors: [.top, .bottom], padding: .zero, size: CGSize(width: width, height: 0))
            addView(profileImageView, anchors: [.centerY], trailing: nameLabel.leadingAnchor, padding: UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 8), size: CGSize(width: 40, height: 40))
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 32).isActive = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

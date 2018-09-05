//
//  ChatLogHeaderView.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 04/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

class ChatLogHeaderView: UIView {
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .darkGray
        label.backgroundColor = .yellow
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        return label
    }()
    
    init(date: Date = Date()) {
        super.init(frame: .zero)
        
        dateLabel.text = dateFormatter.string(from: date)
        
        addView(dateLabel, anchors: Anchors.centers, size: CGSize(width: 128, height: 24))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

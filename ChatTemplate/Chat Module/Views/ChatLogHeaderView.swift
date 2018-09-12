//
//  ChatLogHeaderView.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 04/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

class ChatLogHeaderView: UIView {
    
    // MARK: - Views
    
    let dateLabel: UILabel = create {
        $0.textAlignment = .center
        $0.textColor = ThemeManager.current.subtitleTextColor
        $0.backgroundColor = ThemeManager.current == .light ? .yellow : .brown
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    
    init(date: Date = Date()) {
        super.init(frame: .zero)
        
        dateLabel.text = dateFormatter.string(from: date)
        
        addView(dateLabel, anchors: Anchors.centers, size: CGSize(width: 128, height: 24))
    }
    
    // MARK: - Initializers
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

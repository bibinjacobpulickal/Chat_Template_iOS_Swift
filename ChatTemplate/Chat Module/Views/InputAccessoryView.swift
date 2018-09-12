//
//  InputAccessoryView.swift
//  FirebaseChat
//
//  Created by Bibin Jacob Pulickal on 19/04/2018.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

class InputAccessoryView: UIView {
    
    // MARK: - Variables
    
    var delegate: InputAccessoryViewDelegate?
    
    // MARK: - Views
    
    let textField: UITextField = create {
        $0.keyboardAppearance = ThemeManager.current == .light ? .default : .dark
        $0.attributedPlaceholder = NSAttributedString(string: "Enter message", attributes: [NSAttributedString.Key.foregroundColor: ThemeManager.current.invertedSubtitleTextColor])
        $0.textColor = ThemeManager.current.titleTextColor
    }
    
    let separatorView: UIView = create {
        $0.backgroundColor = ThemeManager.current.invertedSubtitleTextColor
    }
    
    let sendButton: UIButton = create {
        $0.setTitle("Send", for: .normal)
        $0.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
    }
    
    // MARK: - Initializers
    
    init(delegate: InputAccessoryViewDelegate?, height: CGFloat?) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height ?? 48))
        
        self.delegate = delegate
        self.backgroundColor = ThemeManager.current.backgroundColor
        
        setupViews()
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        addView(separatorView, anchors: [.top, .leading, .trailing], size: CGSize(height: 1))
        addView(sendButton, anchors: [.top, .bottom, .trailing], padding: UIEdgeInsets(trailing: 8), size: CGSize(width: 64))
        addView(textField, anchors: [.top, .leading, .bottom], trailing: sendButton.leadingAnchor, padding: UIEdgeInsets(leading: 16, trailing: 16))
    }
    
    // MARK: - Handlers
    
    @objc func handleSend() {
        
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            text != "" else { return }
        delegate?.send(text: text)
        textField.text = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

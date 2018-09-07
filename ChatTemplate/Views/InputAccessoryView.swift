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
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Enter message", attributes: [NSAttributedString.Key.foregroundColor: ThemeManager.current.invertedSubtitleTextColor])
        textField.textColor = ThemeManager.current.titleTextColor
        return textField
    }()
    
    let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = ThemeManager.current.invertedSubtitleTextColor
        return separatorView
    }()
    
    let sendButton: UIButton = {
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Send", for: .normal)
        sendButton.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
        return sendButton
    }()
    
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

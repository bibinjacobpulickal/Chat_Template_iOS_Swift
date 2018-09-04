//
//  InputAccessoryView.swift
//  FirebaseChat
//
//  Created by Bibin Jacob Pulickal on 19/04/2018.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

protocol InputAccessoryViewDelegate {
    func send(text: String)
}

class InputAccessoryView: UIView {
    
    var delegate: InputAccessoryViewDelegate?
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter message"
        return textField
    }()
    
    let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        return separatorView
    }()
    
    let sendButton: UIButton = {
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Send", for: .normal)
        sendButton.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
        return sendButton
    }()
    
    init(delegate: InputAccessoryViewDelegate?, height: CGFloat?) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height ?? 48))
        
        self.delegate = delegate
        self.backgroundColor = .white
        
        addView(separatorView, anchors: [.top, .leading, .trailing], size: CGSize(width: 0, height: 1))
        addView(sendButton, anchors: [.top, .bottom, .trailing], padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8), size: CGSize(width: 64, height: 0))
        addView(textField, anchors: [.top, .leading, .bottom], trailing: sendButton.leadingAnchor, padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
    }
    
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

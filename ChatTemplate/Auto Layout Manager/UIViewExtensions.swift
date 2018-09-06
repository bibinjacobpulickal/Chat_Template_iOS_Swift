//
//  UIViewExtensions.swift
//  FirebaseChat
//
//  Created by Bibin Jacob Pulickal on 14/07/2018.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

extension UIView {
    
    func addView(_ view: UIView, anchors: [Anchors] = [], anchor: Anchor = .init(), padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        addView(view, anchors: anchors, top: anchor.top, leading: anchor.leading, bottom: anchor.bottom, trailing: anchor.trailing, centerX: anchor.centerX, centerY: anchor.centerY, padding: padding, size: size)
    }
    
    func addView(_ view: UIView, anchors: [Anchors] = [], top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        
        if anchors.contains(.top) || top != nil {
            view.topAnchor.constraint(equalTo: top ?? topAnchor, constant: padding.top).isActive = true
        }
        
        if anchors.contains(.left) || left != nil {
            view.leftAnchor.constraint(equalTo: left ?? leftAnchor, constant: padding.left).isActive = true
        }
        
        if anchors.contains(.leading) || leading != nil {
            view.leadingAnchor.constraint(equalTo: leading ?? leadingAnchor, constant: padding.leading).isActive = true
        }
        
        if anchors.contains(.bottom) || bottom != nil {
            view.bottomAnchor.constraint(equalTo: bottom ?? bottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if anchors.contains(.right) || right != nil {
            view.rightAnchor.constraint(equalTo: right ?? rightAnchor, constant: -padding.right).isActive = true
        }
        
        if anchors.contains(.trailing) || trailing != nil {
            view.trailingAnchor.constraint(equalTo: trailing ?? trailingAnchor, constant: -padding.trailing).isActive = true
        }
        
        if anchors.contains(.centerX) || centerX != nil {
            view.centerXAnchor.constraint(equalTo: centerX ?? centerXAnchor, constant: padding.centerX).isActive = true
        }
        
        if anchors.contains(.centerY) || centerY != nil {
            view.centerYAnchor.constraint(equalTo: centerY ?? centerYAnchor, constant: padding.centerY).isActive = true
        }
        
        if size.width != 0 {
            view.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            view.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}



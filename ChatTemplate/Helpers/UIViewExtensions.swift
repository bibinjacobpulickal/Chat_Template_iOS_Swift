//
//  UIViewExtensions.swift
//  FirebaseChat
//
//  Created by Bibin Jacob Pulickal on 14/07/2018.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

public enum Anchors {
    
    case top, left, leading, bottom, right, trailing, centerX, centerY
    
    public static let centers = [centerX, centerY]
    public static let edges = [top, leading, bottom, trailing]
}

struct Anchor {
    
    var top: NSLayoutYAxisAnchor?
    var left: NSLayoutXAxisAnchor?
    var leading: NSLayoutXAxisAnchor?
    var bottom: NSLayoutYAxisAnchor?
    var right: NSLayoutXAxisAnchor?
    var trailing: NSLayoutXAxisAnchor?
    var centerX: NSLayoutXAxisAnchor?
    var centerY: NSLayoutYAxisAnchor?
    
    init(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil) {
        self.top = top
        self.left = left
        self.leading = leading
        self.bottom = bottom
        self.right = right
        self.trailing = trailing
        self.centerX = centerX
        self.centerY = centerY
    }
}

extension UIEdgeInsets {
    
    private static var _leading: CGFloat = 0
    private static var _trailing: CGFloat = 0
    private static var _centerX: CGFloat = 0
    private static var _centerY: CGFloat = 0
    
    var leading: CGFloat {
        get {
            return UIEdgeInsets._leading
        }
        set {
            UIEdgeInsets._leading = newValue
        }
    }
    var trailing: CGFloat {
        get {
            return UIEdgeInsets._trailing
        }
        set {
            UIEdgeInsets._trailing = newValue
        }
    }
    var centerX: CGFloat {
        get {
            return UIEdgeInsets._centerX
        }
        set {
            UIEdgeInsets._centerX = newValue
        }
    }
    var centerY: CGFloat {
        get {
            return UIEdgeInsets._centerY
        }
        set {
            UIEdgeInsets._centerY = newValue
        }
    }
    
    init(top: CGFloat = 0, left: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0, trailing: CGFloat = 0, centerX: CGFloat = 0, centerY: CGFloat = 0) {
        self.init(top: top, left: left, bottom: bottom, right: right)
        self.leading = leading
        self.trailing = trailing
        self.centerX = centerX
        self.centerY = centerY
    }
}

extension CGSize {
    init(width: CGFloat = 0, height: CGFloat = 0) {
        self.init()
        self.width = width
        self.height = height
    }
}

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



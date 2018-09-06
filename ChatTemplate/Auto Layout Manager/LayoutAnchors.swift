//
//  Anchor.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 06/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

enum Anchors {
    
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

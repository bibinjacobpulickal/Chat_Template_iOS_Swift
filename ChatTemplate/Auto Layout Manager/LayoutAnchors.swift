//
//  Anchor.swift
//  AutoLayoutManager
//
//  Created by Bibin Jacob Pulickal on 06/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

enum Anchors: CaseIterable {
    
    case top, left, leading, bottom, right, trailing, centerX, centerY
    
    public static let centers = [centerX, centerY]
    public static let edges = [top, leading, bottom, trailing]
}

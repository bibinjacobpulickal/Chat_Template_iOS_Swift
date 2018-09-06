//
//  Themes.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 06/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

enum Theme: Int {
    
    case light, dark
    
    var mainColor: UIColor {
        switch self {
        case .light:
            return UIColor(argb: "ffffff")
        case .dark:
            return UIColor(argb: "000000")
        }
    }
    
    //Customizing the Navigation Bar
    var barStyle: UIBarStyle {
        switch self {
        case .light:
            return .default
        case .dark:
            return .black
        }
    }
    
    var navigationBackgroundImage: UIImage? {
        return self == .light ? UIImage(named: "navBackground") : nil
    }
    
    var tabBarBackgroundImage: UIImage? {
        return self == .light ? UIImage(named: "tabBarBackground") : nil
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .light:
            return UIColor(argb: "ffffff")
        case .dark:
            return UIColor(argb: "000000")
        }
    }
    
    var secondaryColor: UIColor {
        switch self {
        case .light:
            return UIColor(argb: "ffffff")
        case .dark:
            return UIColor(argb: "000000")
        }
    }
    
    var titleTextColor: UIColor {
        switch self {
        case .light:
            return UIColor(argb: "ffffff")
        case .dark:
            return UIColor(argb: "000000")
        }
    }
    var subtitleTextColor: UIColor {
        switch self {
        case .light:
            return UIColor(argb: "ffffff")
        case .dark:
            return UIColor(argb: "000000")
        }
    }
}

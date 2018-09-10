//
//  DateExtensions.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 10/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

extension Date {
    
    var timeAgoString: String {
        
        let earliest = self < Date() ? self : Date()
        let latest =  self > Date() ? self : Date()
        
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfMonth, .month, .year, .second]
        let components = Calendar.current.dateComponents(unitFlags, from: earliest, to: latest)
        
        if let year = components.year {
            if (year >= 2) {
                return "\(year) years ago"
            } else if (year >= 1) {
                return "Last year"
            }
        }
        if let month = components.month {
            if (month >= 2) {
                return "\(month) months ago"
            } else if (month >= 2) {
                return "Last month"
            }
        }
        if let weekOfYear = components.weekOfYear {
            if (weekOfYear >= 2) {
                return "\(weekOfYear) months ago"
            } else if (weekOfYear >= 2) {
                return "Last week"
            }
        }
        if let day = components.day {
            if (day >= 2) {
                return "\(day) days ago"
            } else if (day >= 2) {
                return "Yesterday"
            }
        }
        if let hour = components.hour {
            if (hour >= 2) {
                return "\(hour) hours ago"
            } else if (hour >= 2) {
                return "An hour ago"
            }
        }
        if let minute = components.minute {
            if (minute >= 2) {
                return "\(minute) minutes ago"
            } else if (minute >= 2) {
                return "A minute ago"
            }
        }
        if let second = components.second {
            if (second >= 3) {
                return "\(second) seconds ago"
            }
        }
        return "Just now"
    }
}

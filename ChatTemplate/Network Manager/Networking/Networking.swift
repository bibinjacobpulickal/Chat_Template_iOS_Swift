//
//  Networking.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 17/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

enum Environment {
    case production
}

class Networking {
    
    static let environment = Environment.production
    
    static func route<T: Codable>(api: API, log: Bool = false, completion: @escaping (Response<T>) -> Void) {
        switch api {
            
        }
    }
}

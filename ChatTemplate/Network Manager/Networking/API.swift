//
//  API.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 17/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

enum API: Endpoint {
    
    var baseUrl: String {
        switch Networking.environment {
        case .production:
            return ""
        }
    }
    
    var pathUrl: String {
        switch self {
            
        }
    }
    
    var urlString: String {
        switch self {
            
        }
    }
    
    var method: HTTPMethod {
        switch self {
            
        }
    }
    
    var headers: HTTPHeader {
        switch self {
            
        }
    }
    
    var encoding: HTTPEncoding? {
        switch self {
            
        }
    }
}

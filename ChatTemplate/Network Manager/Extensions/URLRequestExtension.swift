//
//  URLRequestExtension.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 06/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

extension URLRequest {
    
    init(url: String, method: HTTPMethod = .get, data: Data? = nil, object: Any? = nil, encoding: HTTPEncoding? = .json, headers: HTTPHeader = [:]) throws {
        
        guard let url = URL(string: url) else {
            throw URLError(.badURL)
        }
        
        self.init(url: url)
        self.httpMethod = method.rawValue
        
        if let headers = headers {
            for (key, value) in headers {
                self.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let data = data {
            self.httpBody = data
        } else if let object = object {
            try encode(request: &self, object: object, encoding: encoding ?? .json)
        }
    }
}

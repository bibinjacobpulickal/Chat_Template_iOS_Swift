//
//  URLRequestExtension.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 06/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

extension URLRequest {
    
    init(url: String, method: Method = .get, data: Data? = nil, object: Any? = nil, headers: Header = [:]) throws {
        
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
            self.httpBody = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
        }
    }
}

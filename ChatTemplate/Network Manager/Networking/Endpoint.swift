//
//  Endpoint.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 17/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

protocol Endpoint {
    
    var baseUrl: String { get }
    var pathUrl: String { get }
    var urlString: String { get }
    
    var method: HTTPMethod { get }
    var headers: HTTPHeader { get }
    var encoding: HTTPEncoding? { get }
}

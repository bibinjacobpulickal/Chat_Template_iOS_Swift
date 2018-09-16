//
//  HTTPEncoding.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 15/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

enum HTTPEncoding {
    case json, url
}

func encode(request: inout URLRequest, object: Any, encoding: HTTPEncoding) throws {
    switch encoding {
    case .json:
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONSerialization.data(withJSONObject: object, options: .sortedKeys)
    case .url:
        request.addValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        guard let url = request.url else { throw URLError(.badURL) }
        if var components = URLComponents(url: url, resolvingAgainstBaseURL: false),
            let parameters = object as? [String: Any] {
            components.queryItems = [URLQueryItem]()
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                components.queryItems?.append(queryItem)
            }
            request.url = components.url
        }
    }
}

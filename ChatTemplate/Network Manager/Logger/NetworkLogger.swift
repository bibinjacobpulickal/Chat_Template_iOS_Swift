//
//  NetworkLogger.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 14/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

func logSession(_ request: URLRequest, _ data: Data?, _ response: URLResponse?, _ error: Error?) {
    
    print("\n\(request.httpMethod ?? "URL"):", request)
    
    if let headers = request.allHTTPHeaderFields, !headers.isEmpty {
        print("Headers:", headers)
    }
    if let data = request.httpBody {
        printData("Body:", data)
    }
    if let error = error {
        print("Error:", error.localizedDescription)
    }
    if let response = response as? HTTPURLResponse {
        logResponse(response)
    }
    if let data = data {
        printData("Data:", data)
    }
}

func printData(_ items: Any?...) {
    for item in items {
        if let item = item as? Data,
            let object = try? JSONSerialization.jsonObject(with: item, options: .mutableLeaves),
            let data = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted),
            let string = String(data: data, encoding: .utf8) {
            print(string)
        } else {
            print(item ?? "Item is empty")
        }
    }
}


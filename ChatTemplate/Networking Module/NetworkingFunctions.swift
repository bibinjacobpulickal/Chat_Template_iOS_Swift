//
//  NetworkingFunctions.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 06/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

func session<T: Decodable>(url: String, method: Method = .get, data: Data? = nil, object: Any? = nil, headers: Header = [:], handle: Bool = false, completion: @escaping (Response<T>) -> Void) {
    
    do {
        let request = try URLRequest(url: url, method: method, data: data, object: object, headers: headers)
        
        session(with: request, handle: handle) { (response: Response<T>) in
            completion(response)
        }
        
    } catch {
        completion(.failed(error))
    }
}

func session<T: Decodable>(with request: URLRequest, handle: Bool = false, completion: @escaping (Response<T>) -> Void) {
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        
        if handle {
            handleSession(request, response, error, completion: { (response: Response<T>) in
                completion(response)
            })
        } else if error != nil {
            handleSession(request, response, error, completion: { (response: Response<T>) in
                completion(response)
            })
        }
        
        object(from: data, handle: handle, completion: { (response: Response<T>) in
            completion(response)
        })
        }.resume()
}

func handleSession<T: Decodable>(_ request: URLRequest, _ response: URLResponse?, _ error: Error?, completion: @escaping (Response<T>) -> Void) {
    
    print("\n\(request.httpMethod ?? "URL"):", request)
    
    if request.allHTTPHeaderFields != [:] || request.allHTTPHeaderFields != nil {
        print("Headers:", request.allHTTPHeaderFields ?? "No Headers")
    }
    
    if let data = request.httpBody {
        printData("Body:", data)
    }
    
    if let response = response as? HTTPURLResponse,
        response.statusCode != 200 {
        print("Response Code:", response.statusCode)
    }
    
    if let error = error {
        print("Error:", error.localizedDescription)
        completion(.failed(error))
    }
}

func object<T: Decodable>(from data: Data?, handle: Bool = false, completion: @escaping (Response<T>) -> Void) {
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    guard let data = data else {
        completion(.failed(DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Data corruption error."))))
        return
    }
    
    if let object = try? decoder.decode(T.self, from: data) {
        if handle {
            printData("Decoded Object:", data)
        }
        completion(.decoded(object))
    } else if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) {
        if handle {
            printData("Json Object:", data)
        }
        completion(.serialized(json))
    } else {
        let error = DecodingError.typeMismatch(T.self, DecodingError.Context(codingPath: [], debugDescription: "An error occured while fetching data from servers."))
        print("Error:", error.localizedDescription)
        completion(.failed(error))
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

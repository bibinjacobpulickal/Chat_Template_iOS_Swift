//
//  NetworkingFunctions.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 06/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

func session<T: Decodable>(api: API, data: Data? = nil, object: Any? = nil, log: Bool = false, completion: @escaping (Response<T>) -> Void) {
    
    session(url: api.urlString, method: api.method, data: data, object: object, encoding: api.encoding, headers: api.headers, log: log) { (response: Response<T>) in
            completion(response)
    }
}

func session<T: Decodable>(url: String, method: HTTPMethod = .get, data: Data? = nil, object: Any? = nil, encoding: HTTPEncoding? = .json, headers: HTTPHeader = [:], log: Bool = false, completion: @escaping (Response<T>) -> Void) {
    
    do {
        let request = try URLRequest(url: url, method: method, data: data, object: object, encoding: encoding, headers: headers)
        
        session(with: request, log: log) { (response: Response<T>) in
            completion(response)
        }
        
    } catch {
        completion(.failed(error))
    }
}

func session<T: Decodable>(with request: URLRequest, log: Bool = false, completion: @escaping (Response<T>) -> Void) {
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        
        if error != nil || log {
            logSession(request, data, response, error)
        }
        if let error = error {
            completion(.failed(error))
        }
        
        object(from: data, completion: { (response: Response<T>) in
            completion(response)
        })
        }.resume()
}

func object<T: Decodable>(from data: Data?, completion: @escaping (Response<T>) -> Void) {
    
    guard let data = data else {
        completion(.failed(SessionResponse.emptyData))
        return
    }
    
    do {
        let object = try JSONDecoder().decode(T.self, from: data)
        completion(.decoded(object))
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
        completion(.serialized(json))
    } catch {
        completion(.failed(error))
    }
}

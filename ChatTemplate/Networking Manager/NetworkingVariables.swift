//
//  NetworkingVariables.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 06/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

typealias Header = [String: String?]?

enum Response<T: Codable> {
    
    case decoded(T)
    case failed(Error)
    case serialized(Any)
    
    var error: Error? {
        switch self {
        case .failed(let error):
            return error
        default:
            return nil
        }
    }
    
    var data: Data? {
        switch self {
        case .serialized(let object):
            return try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
        case .decoded(let t):
            return try? JSONEncoder().encode(t)
        default:
            return nil
        }
    }
    
    var json: Any? {
        switch self {
        case .serialized(let json):
            return json
        default:
            return nil
        }
    }
    
    var object: T? {
        switch self {
        case .decoded(let t):
            return t
        default:
            return nil
        }
    }
}

enum Expected<T: Decodable>: Decodable {
    case string(String), expected(T)
    
    init(from decoder: Decoder) throws {
        do {
            self = Expected.expected(try decoder.singleValueContainer().decode(T.self))
        } catch {
            do {
                self = Expected.string(try decoder.singleValueContainer().decode(String.self))
            } catch {
                throw DecodingError.typeMismatch(Expected.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Error decoding ID"))
            }
        }
    }
}

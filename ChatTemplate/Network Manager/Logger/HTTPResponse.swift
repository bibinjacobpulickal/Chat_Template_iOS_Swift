//
//  HTTPResponse.swift
//  ChatTemplate
//
//  Created by Bibin Jacob Pulickal on 15/09/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import Foundation

enum SessionResponse: String, Error {
    case unknown        = "Unknown"
    case success        = "Success"
    case created        = "Created"
    case accepted       = "Accepted"
    case redirection    = "Redirection"
    case clientError    = "Client Error"
    case badRequest     = "Bad Request"
    case unauthorized   = "unauthorized"
    case payRequired    = "Payment Required"
    case forbidden      = "Forbidden"
    case notFound       = "Not Found"
    case notAllowed     = "Method Not Allowed"
    case notAcceptable  = "Not Acceptable"
    case requestTimeout = "Request Timeout"
    case serverError    = "Server Error"
    case internlError   = "Internal Server Error"
    case notImplemented = "Not Implemented"
    case badGateway     = "Bad Gateway"
    case unavailable    = "Service Unavailable"
    case gatewayTimeout = "Gateway Timeout"
    case emptyData      = "Empty Data"
    case decodeError    = "Decoding Failed"
}

func logResponse(_ response: HTTPURLResponse) {
    let code = response.statusCode
    var sessionResponse = SessionResponse.unknown
    switch code {
    case 200:
        sessionResponse = .success
    case 201:
        sessionResponse = .created
    case 202:
        sessionResponse = .accepted
    case 203...299:
        sessionResponse = .success
    case 300...399:
        sessionResponse = .redirection
    case 400:
        sessionResponse = .badRequest
    case 401:
        sessionResponse = .unauthorized
    case 402:
        sessionResponse = .payRequired
    case 403:
        sessionResponse = .forbidden
    case 404:
        sessionResponse = .notFound
    case 405:
        sessionResponse = .notAllowed
    case 406:
        sessionResponse = .notAcceptable
    case 408:
        sessionResponse = .requestTimeout
    case 407...499:
        sessionResponse = .clientError
    case 500:
        sessionResponse = .internlError
    case 501:
        sessionResponse = .notImplemented
    case 502:
        sessionResponse = .badGateway
    case 503:
        sessionResponse = .unavailable
    case 504:
        sessionResponse = .gatewayTimeout
    case 505...599:
        sessionResponse = .serverError
    default:
        sessionResponse = .unknown
    }
    print("Response: \(code) \(sessionResponse.rawValue)")
}

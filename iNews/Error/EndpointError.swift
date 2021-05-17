//
//  EndpointError.swift
//  iNews
//
//  Created by Babu Rajendran on 5/16/21.
//

import Foundation

enum EndpointError : Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension EndpointError : LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Failed to decode the object"
        case .errorCode(let code):
            return "\(code) - Something went wrong"
        case .unknown:
            return "An unknown error occurred!"
        }
    }
}

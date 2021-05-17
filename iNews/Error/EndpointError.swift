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

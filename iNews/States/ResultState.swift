//
//  ResultState.swift
//  iNews
//
//  Created by Babu Rajendran on 5/17/21.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}

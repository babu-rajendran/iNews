//
//  NewsService.swift
//  iNews
//
//  Created by Babu Rajendran on 5/16/21.
//

import Foundation
import Combine

protocol NewsService {
    func request(from endPoint: NewsAPI) -> AnyPublisher<NewsResponse, EndpointError>
}

struct NewsServiceImpl : NewsService {
    func request(from endPoint: NewsAPI) -> AnyPublisher<NewsResponse, EndpointError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endPoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError{ _ in EndpointError.unknown}
            .flatMap{ data, response -> AnyPublisher<NewsResponse, EndpointError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail( error: EndpointError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    return Just(data)
                        .decode(type: NewsResponse.self, decoder: jsonDecoder)
                        .mapError { _ in EndpointError.decodingError}
                        .eraseToAnyPublisher()
                    
                } else {
                    return Fail(error: EndpointError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
        
}

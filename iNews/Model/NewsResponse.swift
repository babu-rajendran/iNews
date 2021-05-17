//
//  NewsResponse.swift
//  iNews
//
//  Created by Babu Rajendran on 5/16/21.
//

import Foundation


struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title: String?
    let articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}
    
extension Article {
    
    static var dummyData : Article {
        .init(author: "David Aaro", url: "https://www.foxnews.com/health/fauci-says-pandemic-exposed-undeniable-effects-of-racism-in-us", source: "Fox News", title: "Fauci says pandemic exposed 'undeniable effects of racism' in US - Fox News", articleDescription: "Dr. Anthony Fauci, the nation's top infectious disease expert, said Sunday the coronavirus outbreak in the U.S. “shone a bright light on our own society's failings” in how the virus impacted minority communities.", image: "https://static.foxnews.com/foxnews.com/content/uploads/2021/05/AP21131583136649.jpg", date: Date())
    }
}

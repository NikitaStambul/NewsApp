//
//  Response.swift
//  NewsApp
//
//  Created by Nikita Stambul on 23.05.2022.
//

import Foundation

struct Response: Codable {
    struct Article: Codable {
        struct Source: Codable {
            let id: String?
            let name: String
        }

        let source: Source
        let author: String
        let title: String
        let description: String
        let url: String
        //.iso8601
        let publishedAt: Date
        let content: String
    }

    let articles: [Article]
}


//https://newsapi.org/v2/top-headlines?country=ua&apiKey=API_KEY
//843b6cc4729745bfa5c76280b4ab2507

//
//  APIConstants.swift
//  NewsApp
//
//  Created by Nikita Stambul on 23.05.2022.
//

import Foundation

struct APIConstants {
    static var API_KEY = "843b6cc4729745bfa5c76280b4ab2507"
    static var baseURL = "https://newsapi.org/v2/top-headlines?country=ua&apiKey="
    static var fullURL: String {
        return baseURL + API_KEY
    }
}

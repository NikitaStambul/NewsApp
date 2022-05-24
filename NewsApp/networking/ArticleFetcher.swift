//
//  ArticleFetcher.swift
//  NewsApp
//
//  Created by Nikita Stambul on 23.05.2022.
//

import Foundation

class ArticleFetcher: ObservableObject {

    @Published var articles = [Article]()
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var searchText = ""

    var filteredArticles: [Article] {
        if !searchText.isEmpty {
            var filteredArticles: [Article] = []
            filteredArticles += articles.filter { $0.title?.lowercased().contains(searchText.lowercased()) ?? false }
            filteredArticles += articles.filter { $0.description?.lowercased().contains(searchText.lowercased()) ?? false }
            filteredArticles += articles.filter { $0.author?.lowercased().contains(searchText.lowercased()) ?? false }
            filteredArticles += articles.filter { $0.content?.lowercased().contains(searchText.lowercased()) ?? false }
            return Array(Set(filteredArticles))
        }
        return articles
    }

    init() {
        fetchArticles()
    }

    func fetchArticles() {

        isLoading = true
        errorMessage = nil

        let service = APIService()

        service.fetchArticles(urlString: APIConstants.fullURL) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false

                switch result {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    print(error)
                case .success(let articles):
                    self?.articles = articles
                }
            }
        }
    }
}

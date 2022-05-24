//
//  ArticleFetcher.swift
//  NewsApp
//
//  Created by Nikita Stambul on 23.05.2022.
//

import Foundation

class AtricleFetcher: ObservableObject {

    @Published var articles = [Article]()
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchArticles() {

        isLoading = true

        let task = URLSession.shared.dataTask(with: APIConstants.fullURL) { [weak self] data, response, error in

            DispatchQueue.main.async {
                self?.isLoading = false
            }

            let decoder = JSONDecoder()

            if let data = data {
                do {
                    let articles = try decoder.decode([Article].self, from: data)

                    DispatchQueue.main.async {
                        self?.articles = articles
                    }

                } catch {
                    print(error)
                }
            }
        }

        task.resume()
    }
}

//
//  APIService.swift
//  NewsApp
//
//  Created by Nikita Stambul on 23.05.2022.
//

import Foundation

struct APIService {
    func fetchArticles(urlString: String, completion: @escaping (Result<[Article], APIError>) -> Void) {

        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error as? URLError {
                completion(.failure(.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(.failure(.badResponse(statusCode: response.statusCode)))
            } else if let data = data {

                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601

                do {
                    let newsResponse = try decoder.decode(NewsResponse.self, from: data)
                    completion(.success(newsResponse.articles))
                } catch {
                    completion(.failure(.parsing(error as? DecodingError)))
                }
            }

        }

        task.resume()
    }
}


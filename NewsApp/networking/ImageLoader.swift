//
//  ImageLoader.swift
//  NewsApp
//
//  Created by Nikita Stambul on 24.05.2022.
//

import Foundation
import UIKit

class ImageLoader: ObservableObject {
    let url: URL?

    @Published var image: UIImage?
    @Published var errorMessage: String?
    @Published var isLoading = false

    init(url: URL?) {
        self.url = url
    }

    func fetchImage() {

        guard image == nil, isLoading == false else { return }

        guard let url = url else {
            errorMessage = APIError.badURL.description
            return
        }

        isLoading = true
        errorMessage = nil

        let request = URLRequest(url: url, cachePolicy: .returnCacheDataDontLoad)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {

                self?.isLoading = false

                if let error = error {
                    self?.errorMessage = error.localizedDescription
                } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    self?.errorMessage = APIError.badResponse(statusCode: response.statusCode).description
                } else if let data = data, let image = UIImage(data: data) {
                    self?.image = image
                } else {
                    self?.errorMessage = APIError.unknown.description
                }
            }
        }

        task.resume()

    }
}

//
//  NewsResponse.swift
//  NewsApp
//
//  Created by Nikita Stambul on 23.05.2022.
//

import Foundation

struct NewsResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable, Identifiable, Hashable {

    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.id == rhs.id
    }


    enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case description
        case articleURL = "url"
        case imageURL = "urlToImage"
        case publishingDate = "publishedAt"
        case content
    }

    struct Source: Decodable, Hashable {
        let id: String?
        let name: String?
    }

    let id: UUID
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let articleURL: URL?
    let imageURL: URL?
    let publishingDate: Date?
    let content: String?

    var unwrappedURL: URL {
        guard let url = articleURL else { return URL(string: "https://newsapi.org/s/ukraine-news-api")! }
        return url
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        source = try container.decodeIfPresent(Source.self, forKey: .source)
        author = try container.decode(String?.self, forKey: .author)
        title = try container.decode(String?.self, forKey: .title)
        description = try container.decode(String?.self, forKey: .description)
        articleURL = try container.decode(URL?.self, forKey: .articleURL)
        imageURL = try container.decode(URL?.self, forKey: .imageURL)
        publishingDate = try container.decode(Date?.self, forKey: .publishingDate)
        content = try container.decode(String?.self, forKey: .author)

        id = UUID()
    }

    init(source: Source, author: String?, title: String?, description: String?, articleURL: URL?, imageURL: URL?, publishingDate: Date?, content: String?) {
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.articleURL = articleURL
        self.imageURL = imageURL
        self.publishingDate = publishingDate
        self.content = content
        id = UUID()
    }

    static func example() -> Article {
        Article(source: Source(id: nil, name: "The Washington Post"), author: "Rachel Pannett, Bryan Pietsch, Annabelle Timsit, Jennifer Hassan", title: "Latest Russia-Ukraine war news: Live updates - The Washington Post", description: "President Volodymyr Zelensky will address the World Economic Forum in Davos, Switzerland, as Severodonetsk becomes a focal point in the war.", articleURL: URL(string: "https://www.washingtonpost.com/world/2022/05/23/russia-ukraine-war-news-live-updates-putin/"), imageURL: URL(string: "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/ZMQGXWWZCUI6ZPQXFBQWJF2MKQ.jpg&w=1440"), publishingDate: Date.now, content: "Russian troops are working on erasing Severodonetsk from the face of the earth, a regional official said this weekend, telling of how the city is becoming the eastern focus of the Kremlins months-lon… [+1627 chars]")
    }

}


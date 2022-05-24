//
//  ArticleRow.swift
//  NewsApp
//
//  Created by Nikita Stambul on 23.05.2022.
//

import SwiftUI

struct ArticleRow: View {
    let article: Article

    var body: some View {
        VStack (spacing: 0) {
            ImageView(url: article.imageURL)

            HStack(alignment: .top, spacing: 15) {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(article.title ?? "Unknown title")
                            .font(.headline)
                            .lineLimit(1)
                        Spacer()
                        Text(article.publishingDate?.formatted(date: .omitted, time: .shortened) ?? "N/A")
                            .font(.caption)
                    }
                    Text(article.source?.name ?? "Unknown source")
                        .font(.body)
                        .lineLimit(1)
                    Text(article.description ?? "Unknown description")
                        .font(.caption)
                        .lineLimit(1)
                }

                Link(destination: article.articleURL!) {
                    ArrowLink()
                        .stroke(lineWidth: 2)
                        .frame(width: 10, height: 20)
                }
                .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 5)
    }
}


struct ArticleRow_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRow(article: Article.example())
            .previewLayout(.fixed(width: 400, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))

    }
}

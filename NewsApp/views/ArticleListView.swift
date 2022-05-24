//
//  ArticleListView.swift
//  NewsApp
//
//  Created by Nikita Stambul on 23.05.2022.
//

import SwiftUI

struct ArticleListView: View {
    @ObservedObject var articleFetcher: ArticleFetcher

    var body: some View {
        NavigationView {
            List {
                ForEach(articleFetcher.filteredArticles) {
                    ArticleRow(article: $0)
                }
            }
            .navigationTitle("Новини")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $articleFetcher.searchText)
        }
        .onAppear {
            URLCache.shared.memoryCapacity = 1024 * 1024 * 128
        }
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(articleFetcher: ArticleFetcher())
    }
}

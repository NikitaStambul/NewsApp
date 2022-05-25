//
//  ErrorView.swift
//  NewsApp
//
//  Created by Nikita Stambul on 23.05.2022.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var articleFetcher: ArticleFetcher

    var body: some View {
        Text(articleFetcher.errorMessage!)
            .font(.largeTitle)
        Button("Try Again", action: articleFetcher.fetchArticles)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(articleFetcher: ArticleFetcher())
    }
}

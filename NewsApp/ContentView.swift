//
//  ContentView.swift
//  NewsApp
//
//  Created by Nikita Stambul on 23.05.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var articleFetcher = ArticleFetcher()

    var body: some View {

        if articleFetcher.isLoading {
            LoadingView()
        } else if articleFetcher.errorMessage != nil {
            ErrorView(articleFetcher: articleFetcher)
        } else {
            ArticleListView(articleFetcher: articleFetcher)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

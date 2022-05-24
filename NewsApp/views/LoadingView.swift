//
//  LoadingView.swift
//  NewsApp
//
//  Created by Nikita Stambul on 23.05.2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 30) {
            ProgressView()
            Text("Загружаємо новини")
                .font(.title)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

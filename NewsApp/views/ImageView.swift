//
//  ImageView.swift
//  NewsApp
//
//  Created by Nikita Stambul on 24.05.2022.
//

import SwiftUI

struct ImageView: View {
    @StateObject var imageLoader: ImageLoader

    init(url: URL?) {
        self._imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }

    var body: some View {
        Group {
            if let uiImage = imageLoader.image {
                VStack(spacing: 0) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding([.bottom], 20)
//            } else if let errorMessage = imageLoader.errorMessage {
//                Text(errorMessage)
//                    .font(.caption)
//                    .foregroundColor(.red)
            } else {
                Rectangle()
                    .frame(width: 0, height: 0)
            }
        }
        .onAppear {
            imageLoader.fetchImage()
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: nil)
    }
}

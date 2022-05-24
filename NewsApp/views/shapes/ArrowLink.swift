//
//  ArrowLink.swift
//  NewsApp
//
//  Created by Nikita Stambul on 23.05.2022.
//

import SwiftUI

struct ArrowLink: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        return path
    }
}

struct ArrowLink_Previews: PreviewProvider {
    static var previews: some View {
        ArrowLink()
    }
}

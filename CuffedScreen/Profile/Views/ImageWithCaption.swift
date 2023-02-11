//
//  ImageWithCaption.swift
//  CuffedScreen
//
//  Created by Shyam Kumar on 2/9/23.
//

import SwiftUI

struct ImageWithCaption: View {
    var clippedSize: CGFloat = UIScreen.main.bounds.width
    var milestone: Milestone
    var body: some View {
        VStack {
            if let image = UIImage(data: milestone.image) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: clippedSize, height: clippedSize)
                    .clipped()
                    .contentShape(Rectangle())
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(milestone.title.uppercased())
                    .font(.headline.monospaced())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.primary)
                Text(milestone.description)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(3)
                    .foregroundColor(.primary)
            }
            .padding(.horizontal)
        }
    }
}

struct ImageWithCaption_Previews: PreviewProvider {
    static var previews: some View {
        ImageWithCaption(milestone: Milestone(image: Data(), title: "Graduated Stanford 2014", description: "Spent 4 years getting a CS degree. Met my best friends here."))
    }
}

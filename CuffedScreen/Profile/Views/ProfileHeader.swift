//
//  ProfileHeader.swift
//  CuffedScreen
//
//  Created by Shyam Kumar on 2/9/23.
//

import SwiftUI

struct ProfileHeader: View {
    @State private var imageData: Data?
    var body: some View {
        VStack(spacing: 12) {
            ImageWithPicker(clippedSize: 120, selectedImageData: $imageData)
            HStack(alignment: .bottom) {
                Text("John Appleseed")
                    .font(.headline)
                Text("28")
                    .font(.subheadline.bold())
                    .foregroundColor(.secondary)
            }
            Text("Live, laugh, love")
                .font(.footnote)
            Button {
                print("hello")
            } label: {
                Text("Edit profile")
                    .font(.footnote)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background { Color.secondary.opacity(0.4) }
                    .clipShape(RoundedRectangle(cornerRadius: 4))
            }
            
        }
        .padding()
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ProfileHeader()
            Spacer()
        }
    }
}

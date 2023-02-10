//
//  ProfileHeader.swift
//  CuffedScreen
//
//  Created by Shyam Kumar on 2/9/23.
//

import SwiftUI

struct ProfileHeader: View {
    @Binding var imageData: Data?
    @Binding var name: String
    @Binding var age: Double
    @Binding var bio: String
    
    var editButtonAction: () -> Void
    var body: some View {
        VStack(spacing: 12) {
            ImageWithPicker(clippedSize: 120, selectedImageData: $imageData)
            HStack(alignment: .bottom) {
                Text(name)
                    .font(.headline)
                Text("\(Int(age))")
                    .font(.subheadline.bold())
                    .foregroundColor(.secondary)
            }
            Text(bio)
                .font(.footnote)
            Button {
                editButtonAction()
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
            ProfileHeader(imageData: .constant(nil), name: .constant("John Appleseed"), age: .constant(28), bio: .constant("Live, laugh, love.")) {}
            Spacer()
        }
    }
}

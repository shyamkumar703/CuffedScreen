//
//  ImageWithPicker.swift
//  CuffedScreen
//
//  Created by Shyam Kumar on 2/9/23.
//

import PhotosUI
import SwiftUI

struct ImageWithPicker: View {
    var clippedSize: CGFloat = 80
    
    // MARK: - State
    @State private var selectedItem: PhotosPickerItem?
    @Binding var selectedImageData: Data?
    
    var body: some View {
        PhotosPicker(
            selection: $selectedItem,
            matching: .images,
            photoLibrary: .shared()
        ) {
            if let imageData = selectedImageData,
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: clippedSize, height: clippedSize)
                    .clipShape(Circle())
            } else {
                Image(systemName: "camera.fill")
                    .tint(.primary)
                    .frame(width: clippedSize, height: clippedSize)
                    .background { Color.secondary.opacity(0.4) }
                    .clipShape(Circle())
            }
        }
        .onChange(of: selectedItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    withAnimation {
                        selectedImageData = data
                    }
                }
            }
        }
    }
}

struct ImageWithPicker_Previews: PreviewProvider {
    static var previews: some View {
        ImageWithPicker(selectedImageData: .constant(nil))
    }
}

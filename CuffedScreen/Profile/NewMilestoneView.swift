//
//  NewMilestoneView.swift
//  CuffedScreen
//
//  Created by Shyam Kumar on 2/10/23.
//

import PhotosUI
import SwiftUI

struct NewMilestoneView: View {
    var clippedSize: CGFloat = UIScreen.main.bounds.width
    
    enum MilestoneField: String, CaseIterable {
        case title = "Title"
        case caption = "Caption"
    }
    
    @State var milestoneTitle: String = ""
    @State var milestoneCaption: String = ""
    @Binding var milestones: [Milestone]
    
    @State private var selectedItem: PhotosPickerItem?
    @State var selectedImageData: Data?
    
    @Environment(\.dismiss) var dismiss
    
    var shouldShowPostButton: Bool {
        !milestoneTitle.isEmpty && !milestoneCaption.isEmpty && selectedImageData != nil
    }
    
    var body: some View {
        VStack {
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
                        .clipped()
                        .contentShape(Rectangle())
                } else {
                    Image(systemName: "camera.fill")
                        .tint(.primary)
                        .frame(width: 120, height: 120)
                        .background { Color.secondary.opacity(0.4) }
                        .clipShape(Circle())
                }
            }
            
            Spacer()
            
            List {
                ForEach(MilestoneField.allCases, id: \.self) { field in
                    NavigationLink {
                        AnyView(viewFor(field))
                    } label: {
                        cellFor(field)
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("New milestone")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if shouldShowPostButton {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        // post and dismiss
                        if let data = selectedImageData {
                            milestones.append(Milestone(image: data, title: milestoneTitle, description: milestoneCaption))
                        }
                        dismiss()
                    }
                    .tint(.primary)
                }
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
    
    func cellFor(_ field: MilestoneField) -> some View {
        switch field {
        case .title:
            return EditProfileCell(title: field.rawValue, value: milestoneTitle) { str in !str.isEmpty }
        case .caption:
            return EditProfileCell(title: field.rawValue, value: milestoneCaption) { str in !str.isEmpty }
        }
    }
    
    func viewFor(_ field: MilestoneField) -> some View {
        switch field {
        case .title:
            return CharacterTextView(
                characterLimit: 30,
                navigationTitle: "Milestone title",
                textFieldAxis: .horizontal,
                text: $milestoneTitle
            )
        case .caption:
            return CharacterTextView(
                characterLimit: 100,
                navigationTitle: "Milestone caption",
                textFieldAxis: .vertical,
                text: $milestoneCaption
            )
        }
    }
}

struct NewMilestoneView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewMilestoneView(milestones: .constant([]), selectedImageData: nil)
        }
    }
}

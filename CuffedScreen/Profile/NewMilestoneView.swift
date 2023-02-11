//
//  NewMilestoneView.swift
//  CuffedScreen
//
//  Created by Shyam Kumar on 2/10/23.
//

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
    
    var imageData: Data?
    
    @Environment(\.dismiss) var dismiss
    
    var shouldShowPostButton: Bool {
        !milestoneTitle.isEmpty && !milestoneCaption.isEmpty
    }
    
    var body: some View {
        VStack {
            if let imageData,
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: clippedSize, height: clippedSize)
                    .clipped()
                    .contentShape(Rectangle())
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
            } else {
                // error handle
            }
        }
        .navigationTitle("New milestone")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if shouldShowPostButton {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        // post and dismiss
                        if let data = imageData {
                            milestones.append(Milestone(image: data, title: milestoneTitle, description: milestoneCaption))
                        }
                        dismiss()
                    }
                    .tint(.primary)
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
            NewMilestoneView(milestones: .constant([]), imageData: UIImage(named: "stock")?.pngData())
        }
    }
}

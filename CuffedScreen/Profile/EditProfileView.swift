//
//  EditProfileView.swift
//  CuffedScreen
//
//  Created by Shyam Kumar on 2/10/23.
//

import SwiftUI

struct EditProfileView: View {
    @Binding var imageData: Data?
    @Binding var name: String
    @Binding var bio: String
    @Binding var age: Double
    
    @Environment(\.dismiss) var dismiss
    
    enum ProfileField: String, CaseIterable {
        case name = "Name"
        case bio = "Bio"
        case age = "Age"
    }
    
    var body: some View {
        VStack(spacing: 12) {
            ImageWithPicker(clippedSize: 120, selectedImageData: $imageData)
            List {
                ForEach(ProfileField.allCases, id: \.self) { field in
                    NavigationLink {
                        AnyView(viewFor(field))
                    } label: {
                        cellFor(field)
                    }
                }
            }
            .listStyle(.plain)
        }
        .padding()
        .navigationTitle("Edit profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    // dismiss
                    dismiss()
                }
                .tint(.primary)
            }
        }
    }
    
    func cellFor(_ field: ProfileField) -> some View {
        switch field {
        case .name:
            return EditProfileCell(title: field.rawValue, value: name)
        case .bio:
            return EditProfileCell(title: field.rawValue, value: bio)
        case .age:
            return EditProfileCell(title: field.rawValue, value: String(Int(age)))
        }
    }
    
    func viewFor(_ field: ProfileField) -> any View {
        switch field {
        case .name:
            return CharacterTextView(
                characterLimit: 30,
                navigationTitle: "Name",
                textFieldAxis: .horizontal,
                text: $name
            )
        case .bio:
            return CharacterTextView(
                characterLimit: 100,
                navigationTitle: "Bio",
                textFieldAxis: .vertical,
                text: $bio
            )
        case .age:
            return NumberSliderView(navigationTitle: "Age", age: $age)
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditProfileView(imageData: .constant(nil), name: .constant("John Appleseed"), bio: .constant("Live, laugh, love"), age: .constant(26))
                .preferredColorScheme(.light)
        }
    }
}

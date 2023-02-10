//
//  CharacterTextView.swift
//  CuffedScreen
//
//  Created by Shyam Kumar on 2/9/23.
//

import Combine
import SwiftUI

struct CharacterTextView: View {
    var characterLimit: Int
    var navigationTitle: String
    var textFieldAxis: Axis = .horizontal
    @Binding var text: String
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack {
            TextField(navigationTitle, text: $text, axis: textFieldAxis)
                .padding(.trailing, 24)
                .overlay(alignment: .trailing) {
                    if !text.isEmpty {
                        Button {
                            text = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .tint(.secondary)
                        }
                    }
                }
                .onReceive(Just(text)) { _ in
                    if text.count > characterLimit {
                        text = String(text.prefix(characterLimit))
                    }
                }
            Divider()
            HStack {
                Text("\(text.count)")
                    .font(.caption)
                    .foregroundColor(text.count == characterLimit ? .red: .primary) +
                Text("/\(characterLimit)")
                    .font(.caption)
                    .foregroundColor(.primary)
                Spacer()
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    // pop
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
                .tint(.primary)
            }
        }
    }
}

struct CharacterTextView_Previews: PreviewProvider {
    @State static var text = ""
    static var previews: some View {
        NavigationView {
            VStack {
                CharacterTextView(characterLimit: 30, navigationTitle: "Name", text: $text)
                Spacer()
            }
        }
    }
}

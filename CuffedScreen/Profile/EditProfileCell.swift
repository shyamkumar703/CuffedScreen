//
//  EditProfileCell.swift
//  CuffedScreen
//
//  Created by Shyam Kumar on 2/10/23.
//

import SwiftUI

struct EditProfileCell: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.primary)
            Spacer(minLength: 16)
            Text(value)
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
        .padding(.vertical, 4)
//        .padding(.horizontal, 8)
    }
}

struct EditProfileCell_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileCell(title: "Name", value: "Shyam Kumar")
    }
}

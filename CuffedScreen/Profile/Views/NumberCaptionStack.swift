//
//  NumberCaptionStack.swift
//  CuffedScreen
//
//  Created by Shyam Kumar on 2/9/23.
//

import SwiftUI

struct NumberCaptionStack: View {
    var number: String
    var caption: String
    var body: some View {
        VStack {
            Text(number)
                .font(.headline)
            Text(caption)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct NumberCaptionStack_Previews: PreviewProvider {
    static var previews: some View {
        NumberCaptionStack(number: "5", caption: "milestones")
    }
}

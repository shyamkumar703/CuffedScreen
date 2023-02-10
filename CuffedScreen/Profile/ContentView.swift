//
//  ContentView.swift
//  CuffedScreen
//
//  Created by Shyam Kumar on 2/9/23.
//

import SwiftUI

struct ContentView: View {
    @State var imageData: Data?
    @State private var isShowingEditProfile = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ProfileHeader()
            HStack {
                Text("MILESTONES")
                    .font(.subheadline.monospaced())
                Spacer()
                Image(systemName: "plus")
                    .font(.subheadline.monospaced())
                    .fontWeight(.medium)
                    .tint(.primary)
                    .onTapGesture {
                        print("hello")
                    }
            }
            .padding(.horizontal)

            VStack(spacing: 40) {
                ImageWithCaption()
                ImageWithCaption()
            }
        }
        .sheet(isPresented: $isShowingEditProfile) {
            EditProfileView(imageData: $imageData, name: .constant("John Appleseed"), bio: .constant("Live, laugh, love."), age: .constant(22))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

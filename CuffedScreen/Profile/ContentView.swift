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
    @State private var name: String = "John Appleseed"
    @State private var age: Double = 28
    @State private var bio: String = "Live, laugh, love"
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ProfileHeader(imageData: $imageData, name: $name, age: $age, bio: $bio) {
                isShowingEditProfile.toggle()
            }
            HStack {
                Text("MILESTONES")
                    .font(.subheadline.monospaced())
                Spacer()
                Button {
                    // add milestone
                } label: {
                    Image(systemName: "plus")
                        .font(.subheadline.monospaced())
                        .fontWeight(.medium)
                        .tint(.primary)
                }
            }
            .padding(.horizontal)

            VStack(spacing: 40) {
                ImageWithCaption()
                ImageWithCaption()
            }
        }
        .sheet(isPresented: $isShowingEditProfile) {
            NavigationView {
                EditProfileView(imageData: $imageData, name: $name, bio: $bio, age: $age)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

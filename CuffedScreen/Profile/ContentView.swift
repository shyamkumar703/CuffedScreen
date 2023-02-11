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
    @State private var isShowingNewMilestone = false
    @State private var name: String = "John Appleseed"
    @State private var age: Double = 28
    @State private var bio: String = "Live, laugh, love"
    @State private var milestones: [Milestone] = []
    
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
                    isShowingNewMilestone.toggle()
                } label: {
                    Image(systemName: "plus")
                        .font(.subheadline.monospaced())
                        .fontWeight(.medium)
                        .tint(.primary)
                }
            }
            .padding(.horizontal)

            VStack(spacing: 40) {
                ForEach(milestones) { milestone in
                    ImageWithCaption(milestone: milestone)
                }
            }
        }
        .sheet(isPresented: $isShowingEditProfile) {
            NavigationView {
                EditProfileView(imageData: $imageData, name: $name, bio: $bio, age: $age)
            }
        }
        .sheet(isPresented: $isShowingNewMilestone) {
            NavigationView {
                NewMilestoneView(milestones: $milestones)
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

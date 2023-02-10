//
//  NumberSliderView.swift
//  CuffedScreen
//
//  Created by Shyam Kumar on 2/10/23.
//

import SwiftUI

struct NumberSliderView: View {
    var navigationTitle: String
    @Binding var age: Double
    var body: some View {
        VStack {
            Text("\(Int(age))")
                .font(.largeTitle.bold())
            Slider(value: $age, in: 18...110, step: 1)
                .tint(.primary)
            Spacer()
        }
        .padding()
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NumberSliderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NumberSliderView(navigationTitle: "Age", age: .constant(22))
        }
    }
}

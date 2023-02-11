//
//  Milestone.swift
//  CuffedScreen
//
//  Created by Shyam Kumar on 2/9/23.
//

import Foundation

class Milestone: Codable, Identifiable {
    var id: UUID = UUID()
    var image: Data
    var title: String
    var description: String
    
    init(image: Data, title: String, description: String) {
        self.image = image
        self.title = title
        self.description = description
    }
}

//
//  Profile.swift
//  CuffedScreen
//
//  Created by Shyam Kumar on 2/9/23.
//

import Foundation

class Profile: Codable {
    var name: String?
    var age: Int?
    var bio: String?
    var image: Data?
    var milestones: [Milestone] = []
}

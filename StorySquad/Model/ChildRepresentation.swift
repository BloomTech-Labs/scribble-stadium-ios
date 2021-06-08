//
//  ChildRepresentation.swift
//  Story Squad
//
//  Created by Percy Ngan on 2/26/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct ChildRepresentation: Codable {
    let childID: Int
    let avatarURL: URL
    let gradeLevel: String
    let name: String
    let pin: String
    let isDyslexic: Bool
    let cohortID: Int
    let parentID: Int
    
    enum ChildKeys: String, CodingKey {
        case id = "ID"
        case avatarURL = "AvatarURL"
        case gradeLevel = "GradeLevel"
        case name = "Name"
        case pin = "PIN"
        case isDyslexic = "IsDyslexic"
        case cohortID = "CohortID"
        case parentID = "ParentID"
    }
    
    // Regular init
    init(childID: Int, avatarURL: URL, gradeLevel: String, name: String, pin: String, isDyslexic: Bool, cohortID: Int, parentID: Int) {
        self.childID = childID
        self.avatarURL = avatarURL
        self.gradeLevel = gradeLevel
        self.name = name
        self.pin = pin
        self.isDyslexic = isDyslexic
        self.cohortID = cohortID
        self.parentID = parentID
    }
    
    // init when Decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ChildKeys.self)
        
        childID = try container.decode(Int.self, forKey: .id)
        avatarURL = try container.decode(URL.self, forKey: .avatarURL)
        gradeLevel = try container.decode(String.self, forKey: .gradeLevel)
        name = try container.decode(String.self, forKey: .name)
        pin = try container.decode(String.self, forKey: .pin)
        isDyslexic = try container.decode(Bool.self, forKey: .isDyslexic)
        cohortID = try container.decode(Int.self, forKey: .cohortID)
        parentID = try container.decode(Int.self, forKey: .parentID)
    }
}

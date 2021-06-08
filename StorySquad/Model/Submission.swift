//
//  Submission.swift
//  StorySquad
//
//  Created by Bohdan Tkachenko on 6/7/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

class Submission: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case childId = "ChildID"
        case storyId = "StoryID"
        case cohortId = "CohortID"
        case hasRead = "HasRead"
        case hasWritten = "HasWritten"
        case hasDrawn = "HasDrawn"
        case complexity = "Complexity"
        case status = "Status"
        case pages
        case image
    }
    
    var id: Int
    var childId: Int
    var storyId: Int
    var cohortId: Int
    var hasRead: Bool
    var hasWritten: Bool
    var hasDrawn: Bool
    var complexity: String?
    var pages: [Page]
    var image: Image
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.childId = try container.decode(Int.self, forKey: .childId)
        self.storyId = try container.decode(Int.self, forKey: .storyId)
        self.cohortId = try container.decode(Int.self, forKey: .cohortId)
        self.hasRead = try container.decode(Bool.self, forKey: .hasRead)
        self.hasWritten = try container.decode(Bool.self, forKey: .hasWritten)
        self.hasDrawn = try container.decode(Bool.self, forKey: .hasDrawn)
        self.complexity = try container.decode(String.self, forKey: .complexity)
        self.pages = try container.decode([Page].self, forKey: .pages)
        self.image = try container.decode(Image.self, forKey: .image)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(childId, forKey: .childId)
        try container.encode(storyId, forKey: .storyId)
        try container.encode(cohortId, forKey: .cohortId)
        try container.encode(hasRead, forKey: .hasRead)
        try container.encode(hasWritten, forKey: .hasWritten)
        try container.encode(complexity, forKey: .complexity)
        try container.encode(pages, forKey: .pages)
        try container.encode(image, forKey: .image)
    }
    
    /*
     FULL SUBMISSION
     {
     "ID": 0,
     "ChildId": 0,
     "StoryId": 0,
     "CohortId": 0,
     "HasRead": true,
     "HasWritten": true,
     "HasDrawn": true,
     "Complexity": 0,
     "pages": [
     {
     "ID": 1,
     "URL": "http://someurl.com",
     "SubmissionID": 1,
     "PageNum": 1
     }
     ],
     "image": {
     "ID": 1,
     "URL": "http://someurl.com",
     "SubmissionID": 1
     }
     }
     */
    
    //
    
}




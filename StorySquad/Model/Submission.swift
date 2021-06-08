//
//  Submission.swift
//  StorySquad
//
//  Created by Bohdan Tkachenko on 6/7/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

struct Submission: Codable {

    let id: Int
    let childId: Int
    let storyId: Int
    let cohortId: Int
    var hasRead: Bool
    var hasWritten: Bool
    var hasDrawn: Bool
    let complexity: String
    var pages: [Page]
    var image: [Image]
    
    init(from decoder: Decoder) throws {

    }
    
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
    
    }




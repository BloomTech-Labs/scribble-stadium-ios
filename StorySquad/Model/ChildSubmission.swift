//
//  ChildSubmission.swift
//  StorySquad
//
//  Created by Bohdan Tkachenko on 6/7/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

class ChildSubmission: Submission {
    
    enum CodingKeys: String, CodingKey {
        case status = "Status"
    }
    
    var status: String
    
    internal init(id: Int, childId: Int, storyId: Int, cohortId: Int, hasRead: Bool, hasWritten: Bool, hasDrawn: Bool, complexity: String? = nil, status: String) {
        self.id = id
        self.childId = childId
        self.storyId = storyId
        self.cohortId = cohortId
        self.hasRead = hasRead
        self.hasWritten = hasWritten
        self.hasDrawn = hasDrawn
        self.complexity = complexity
        self.status = status
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

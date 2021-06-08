//
//  ChildSubmission.swift
//  StorySquad
//
//  Created by Bohdan Tkachenko on 6/7/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

struct ChildSubmission: Codable {
    
    init(from decoder: Decoder) throws {
        <#code#>
    }
    
    func encode(to encoder: Encoder) throws {
        <#code#>
    }
    
    let id: Int
    let childId: Int
    let storyId: Int
    let cohortId: Int
    let hasRead: Bool
    let hasWritten: Bool
    let hasDrawn: Bool
    let complexity: Any
    let status: String
    
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
        
    }
}

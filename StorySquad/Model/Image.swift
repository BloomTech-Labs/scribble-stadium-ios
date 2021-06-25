//
//  Image.swift
//  StorySquad
//
//  Created by Bohdan Tkachenko on 6/24/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

struct Image: Codable {

    let id: Int
    let url: String
    let submissionId: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case url = "URL"
        case submissionId = "SubmissionID"
    }
}

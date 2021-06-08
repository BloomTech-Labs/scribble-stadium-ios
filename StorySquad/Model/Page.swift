//
//  Page.swift
//  StorySquad
//
//  Created by Bohdan Tkachenko on 6/7/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

struct Page: Codable {
    let id: Int
    let url: String
    let submissionId: Int?
    let pageNum: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case url = "URL"
        case submissionId = "SubmissionID"
        case pageNum = "PageNum"
    }
}

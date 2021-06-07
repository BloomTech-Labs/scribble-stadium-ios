//
//  Page.swift
//  StorySquad
//
//  Created by Bohdan Tkachenko on 6/7/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

struct Page: Codable{
    let url: String
    let submissionID: Int
    let checksum: String?
    
    enum CodingKeys: String, CodingKey {
            case url = "URL"
            case submissionID = "SumbisionID"
            case checksum
        }
}

struct PageSubmission: Codable {
    let storyId: Int
    var pages: [Page]
//    let pageNum: Int
}

//
//  Story.swift
//  StorySquad
//
//  Created by Bohdan Tkachenko on 6/24/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

struct Story: Codable {
    let id: Int
    let title: String
    let writingPrompt: String
    let drawingPrompt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case title = "Title"
        case writingPrompt = "WritingPrompt"
        case drawingPrompt = "DrawingPrompt"
    }
}

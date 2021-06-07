//
//  ChildSubmission.swift
//  StorySquad
//
//  Created by Bohdan Tkachenko on 6/7/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

struct ChildSubmission {
    
    let id: Int
    let childId: Int
    let storyId: Int
    var hasRead: Bool
    var hasDrawn: Bool
    let complexity: NSObject?
    let status: NSObject?
    
//    "ID": 1,
//      "ChildID": 1,
//      "StoryID": 1,
//      "CohortID": 1,
//      "HasRead": false,
//      "HasWritten": false,
//      "HasDrawn": false,
//      "Complexity": null,
//      "Status": "PENDING"
}

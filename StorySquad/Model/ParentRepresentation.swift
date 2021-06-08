//
//  ParentRepresentation.swift
//  Story Squad
//
//  Created by Percy Ngan on 2/26/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct ParentRepresentation: Codable {
    let parentID: Int
    let name: String
    let email: String
    let pin: String
    
    private enum ParentCodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case email = "Email"
        case pin = "PIN"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ParentCodingKeys.self)
        
        parentID = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        email = try container.decode(String.self, forKey: .email)
        pin = try container.decode(String.self, forKey: .pin)
    }
}

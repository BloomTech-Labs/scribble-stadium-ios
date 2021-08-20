//
//  Scribble.swift
//  StorySquad
//
//  Created by patelpra on 8/3/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

struct Scribble {
    var name: String
    var image: UIImage
    
    init(name: String) {
        self.name = name
        self.image = UIImage(named: name)!
    }
}

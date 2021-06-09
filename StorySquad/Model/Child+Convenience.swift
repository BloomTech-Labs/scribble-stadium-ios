//
//  Child+Convenience.swift
//  Story Squad
//
//  Created by Percy Ngan on 2/26/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import CoreData
extension Child {
    // MARK: CoreData Initializer
    @discardableResult convenience init(childID: Int16,
                                        avatarURL: String,
                                        gradeLevel: String,
                                        name: String,
                                        pin: String,
                                        isDyslexic: Bool,
                                        cohortID: Int16,
                                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.childID = childID
        self.avatarURL = avatarURL
        self.gradeLevel = gradeLevel
        self.name = name
        self.pin = pin
        self.isDyslexic = isDyslexic
        //self.cohortID = cohortID
    }

    // MARK: Init from Representation
    @discardableResult convenience init?(childRepresentation: ChildRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {

        self.init(childID: Int16(childRepresentation.childID),
                  avatarURL: try! String(contentsOf: childRepresentation.avatarURL),
                  gradeLevel: childRepresentation.gradeLevel,
                  name: childRepresentation.name,
                  pin: childRepresentation.pin,
                  isDyslexic: childRepresentation.isDyslexic,
                  cohortID: Int16(childRepresentation.cohortID),
                  context: context)
    }
}

//
//  Parent+Convenience.swift
//  Story Squad
//
//  Created by Percy Ngan on 2/26/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import CoreData
extension Parent {
    // MARK: CoreData Inititalizer
    @discardableResult convenience init(parentID: Int16,
                                        name: String,
                                        email: String,
                                        pin: String,
                                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.parentID = parentID
        self.name = name
        self.email = email
        self.pin = pin
    }

    // MARK: Init from Representation
    @discardableResult convenience init?(parentRepresentation: ParentRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {

        self.init(parentID: Int16(parentRepresentation.parentID),
                  name: parentRepresentation.name,
                  email: parentRepresentation.email,
                  pin: parentRepresentation.pin,
                  context: context)
    }
}

//
//  Parent+Convenience.swift
//  Story Squad
//
//  Created by Percy Ngan on 2/26/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import CoreData
/// Note from Cora: uncomment this after you create the CoreData model file
extension Parent {
    // MARK: CoreData Inititalizer
    @discardableResult convenience init(parentID: Int16,
                                        email: String,
                                        name: String,
                                        pin: String,
                                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.parentID = parentID
        self.email = email
        self.name = name
        self.pin = pin
    }

    // MARK: Init from Representation
    @discardableResult convenience init?(parentRepresentation: ParentRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {

        self.init(parentID: Int16(parentRepresentation.parentID),
                  email: parentRepresentation.email,
                  name: parentRepresentation.name,
                  pin: parentRepresentation.pin,
                  context: context)
    }
}

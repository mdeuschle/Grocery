//
//  Recipe+CoreDataProperties.swift
//  Grocery
//
//  Created by Matt Deuschle on 5/14/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Recipe {

    @NSManaged var title: String?
    @NSManaged var steps: String?
    @NSManaged var ingrediants: String?
    @NSManaged var image: NSData?

}

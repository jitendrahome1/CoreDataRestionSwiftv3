//
//  Manager+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Jitendra on 5/10/17.
//  Copyright © 2017 Jitendra. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Manager {

    @NSManaged var mangPhone: String?
    @NSManaged var mangEmail: String?
    @NSManaged var mangPassword: String?
    @NSManaged var mangAddress: String?
    @NSManaged var rManager: NSSet?

}

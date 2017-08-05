//
//  Employees+CoreDataProperties.swift
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

extension Employees {

    @NSManaged var empAddress: String?
    @NSManaged var empName: String?
    @NSManaged var phoneNumber: String?
    @NSManaged var mangEmail: String?
    @NSManaged var rEmployee: Manager?

}

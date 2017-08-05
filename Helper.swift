//
//  Helper.swift
//  CoreDataDemo
//
//  Created by Jitendra on 5/10/17.
//  Copyright © 2017 Jitendra. All rights reserved.
//

import UIKit

class Helper: NSObject {
    var loginEmail: String?
    static let sharedClient = Helper()
    private override init() { }
}

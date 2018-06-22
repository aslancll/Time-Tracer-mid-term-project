//
//  Activity.swift
//  Time Tracer
//
//  Created by Celal Aslan on 2018-06-15.
//  Copyright © 2018 Celal Aslan. All rights reserved.
//

import Foundation
import CoreData

class Activity: NSManagedObject {

    /// name of activity
    @NSManaged var name: String?
}


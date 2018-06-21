//
//  Activity+CoreDataProperties.swift
//  Time Tracer
//
//  Created by Celal Aslan on 2018-06-19.
//  Copyright © 2018 Celal Aslan. All rights reserved.
//

import Foundation
import CoreData

extension Activity {
    
    /// start date of activity
    @NSManaged var startDate: NSDate?
    /// end date of activity
    @NSManaged var endDate: NSDate?
    /// name of activity
    @NSManaged var name: String?
    
}

//
//  Logs.swift
//  Time Tracer
//
//  Created by Celal on 2018-09-15.
//  Copyright © 2018 Celal Aslan. All rights reserved.
//

import Foundation
import CoreData

class Logs: NSManagedObject {
    
    /// name of activity
    @NSManaged var name: String?
    
    /// duration of the activity
    @NSManaged var duration: NSNumber?
}

//var log: [Logs]?
//
//func saveData (log:[Logs]) {
//    UserDefaults.standard.set(Logs.self, forKey: "log")
//}
//
//func fetchData() -> [Logs]? {
//    
//    if let log = UserDefaults.standard.array(forKey: "log") as? [Logs] {
//        return log
//    } else {
//        return nil
//    }
//}

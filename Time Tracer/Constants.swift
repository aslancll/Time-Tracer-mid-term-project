//
//  Constants.swift
//  Time Tracer
//
//  Created by Celal Aslan on 2018-06-19.
//  Copyright © 2018 Celal Aslan. All rights reserved.
//

import Foundation

var activityList: [String]?

func saveData (activityList:[String]) {
    UserDefaults.standard.set(activityList, forKey: "activityList")
}

func fetchData() -> [String]? {
    
    if let activity = UserDefaults.standard.array(forKey: "activityList") as? [String] {
        return activity
    } else {
        return nil
    }
}

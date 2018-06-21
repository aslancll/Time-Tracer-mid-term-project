//
//  ActivityListViewController.swift
//  Time Tracer
//
//  Created by Celal Aslan on 2018-06-20.
//  Copyright © 2018 Celal Aslan. All rights reserved.
//

import UIKit

class ActivityListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let activity = activityList {
            return activity.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        if let activity = activityList {
            
            cell.textLabel?.text = activity[indexPath.row]
        }
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            activityList?.remove(at: indexPath.row)
        }
        activityListTableView.reloadData()
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.activityListTableView.isEditing = true
//        print("Tapped")
//    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            activityList?.remove(at: indexPath.row)
            self.activityListTableView.reloadData()
        }
        
        let share = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            // share item at indexPath
//            activityList?.replaceSubrange(indexPath.sorted(), with: activityList)
        }
        
        share.backgroundColor = UIColor.yellow
        
        return [delete, share]
    }

    @IBOutlet weak var activityListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityListTableView.delegate = self
        activityListTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        activityListTableView.reloadData()

    }
}

//
//  FirstViewController.swift
//  Time Tracer
//
//  Created by Celal Aslan on 2018-06-15.
//  Copyright © 2018 Celal Aslan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    /// boolean value to determine whether an activity is running
    var isActivityRunning: Bool = false
    /// boolean value to determine whether an activity is paused
    var isActivityPaused: Bool = false
    /// passed seconds from start
    var passedSeconds: Int = 0
    
    /// date of start
//    var startDate: NSDate!
    /// date of quitting the app
//    var quitDate: NSDate?
    
    /// timer that counts the seconds
    var activityTimer: Timer?
    /// total number of seconds for history objects
    var totalduration: NSInteger = 0
    
    /// array of all the activities (history objects) that happened today
//    var todaysActivitiesArray: [History] = []
    
    /// today's date formatter
    lazy var todayDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd"
        return dateFormatter
    }()
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startPauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var currentDateField: UITextField!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        currentDateField.becomeFirstResponder()
        currentDateField.delegate = self
    }

    func dateTapped() {
        
        DatePickerDialog().show("DatePicker", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            self.currentDateField.text = dateFormatter.string(from: date!)
        }
    }
    
    
    /**
     IBAction method to handle the start and pause button's press action.
     */
    @IBAction func startPauseActivity() {
        startActivity()
        if isActivityRunning == true {
            pauseActivity()
        } else {
            if isActivityPaused == true {
                isActivityPaused = false
                isActivityRunning = true
                startPauseButton.setTitle("Pause Activity", for: [])
                startActivityTimer()
            } else {
                print("openActivityView()")
            }
        }
    }
    
    /**
     Stop the activity and save it to core data.
     */
    @IBAction func stopActivity() {
        invalidateTimer()
        isActivityRunning = false
        isActivityPaused = false
        secondsLabel.text = "00"
        minutesLabel.text = "00"
        hoursLabel.text = "00"
//        activityLabel.text = "Start your activity"
        startPauseButton.setTitle("Start activity", for: [])
//        if passedSeconds != 0 {
//            saveActivityToHistory()
//        }
    }
    
    /**
     Start the new activity. start timer and set properties.
     */
    func startActivity() {
//        startDate = NSDate()
        passedSeconds = 0
        invalidateTimer()
        startActivityTimer()
        startPauseButton.setTitle("Pause Activity", for: [])
        isActivityRunning = true
        isActivityPaused = false
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
//        activityLabel.text = "\(choosenActivity!.name!) started at \(dateFormatter.string(from: startDate as Date))"
    }
    
    /**
     Pause the activity.
     */
    func pauseActivity() {
        isActivityPaused = true
        isActivityRunning = false
        invalidateTimer()
        startPauseButton.setTitle("Resume Activity", for: [])
    }
    
    func startActivityTimer() {
        activityTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(MainViewController.updateLabel), userInfo: nil, repeats: true)
    }

    
    /**
     Stop the timer
     */
    func invalidateTimer() {
        if let timer = activityTimer {
            timer.invalidate()
        }
    }
    
    /**
     Creates a string from the passed in integer
     - parameter time: integer to use for creating the time string
     */
    func timeStringWithTimeToDisplay(time: Int) -> String {
        return String(format: "%.2d", time)
    }
    
    
    /**
     Update labels every time the timer's method called.
     */
    @objc func updateLabel() {
        passedSeconds = passedSeconds + 1
        
        let seconds = passedSeconds % 60
        let minutes = (passedSeconds / 60) % 60
        let hours = passedSeconds / 3600
        
        secondsLabel.text = timeStringWithTimeToDisplay(time: seconds)
        minutesLabel.text = timeStringWithTimeToDisplay(time: minutes)
        hoursLabel.text = timeStringWithTimeToDisplay(time: hours)
    }

    
    
//    // MARK: tableView methods
//    /**
//     Asks the data source for a cell to insert in a particular location of the table view.
//
//     - parameter tableView: tableView
//     - parameter indexPath: indexPath
//
//     - returns: created cell
//     */
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! HistoryCell
//
//        let history = todaysActivitiesArray[indexPath.row]
//
//        cell.timeLabel.text = "\(todayDateFormatter.string(from: history.startDate! as Date as Date)) -  \(todayDateFormatter.string(from: history.endDate! as Date))"
//        cell.durationLabel.text = NSString.createDurationStringFromDuration(duration: (history.duration?.doubleValue)!)
//
//        return cell
//    }
//
//    /**
//     How many rows/cells to display
//
//     - parameter tableView: tableView
//     - parameter section:   in which section
//
//     - returns: number of rows
//     */
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return todaysActivitiesArray.count
//    }
//
//    /**
//     Height for each cell
//
//     - parameter tableView: tableView
//     - parameter indexPath: at which indexpath
//
//     - returns: height
//     */
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 72
//    }
//
//    /**
//     Height for the headerview
//
//     - parameter tableView: tableView
//     - parameter section:   at which section
//
//     - returns: height
//     */
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 30
//    }
//
//    /**
//     What view to use for each section
//
//     - parameter tableView: tableView
//     - parameter section:   at which section
//
//     - returns: headerView
//     */
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let title = self.tableView(tableView, titleForHeaderInSection: section)
//        let heightForRow = self.tableView(tableView, heightForHeaderInSection: section)
//        //        let cgFloat: CGFloat = tableView.frame.size.width
//        let headerView = HeaderView(frame: CGRect.init(x: 0.0, y: 0.0, width: (tableView.frame.size.width) , height: heightForRow), title: title! as NSString)
//        return headerView
//    }
//
//    /**
//     What the title should be
//
//     - parameter tableView: tableView
//     - parameter section:   at which section
//
//     - returns: title
//     */
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return String(format: "Total spent today: \(NSString.createDurationStringFromDuration(duration: Double(totalduration)))")
//    }
    
    
    
}

extension MainViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == currentDateField {
            dateTapped()
            return false
        }
        return true
    }
}


//func configureTapGesture() {
//    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
//    view.addGestureRecognizer(tapGesture)
//}
//
//@objc func handleTap() {
//    print("handleTap method was called")
//    view.endEditing(true)
//}


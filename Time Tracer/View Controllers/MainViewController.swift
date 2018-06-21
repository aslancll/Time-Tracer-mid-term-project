//
//  FirstViewController.swift
//  Time Tracer
//
//  Created by Celal Aslan on 2018-06-15.
//  Copyright © 2018 Celal Aslan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startPauseButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
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


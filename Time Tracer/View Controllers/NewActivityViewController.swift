//
//  NewActivityViewController.swift
//  Time Tracer
//
//  Created by Celal Aslan on 2018-06-19.
//  Copyright © 2018 Celal Aslan. All rights reserved.
//

import UIKit

class NewActivityViewController: UIViewController {

    @IBOutlet weak var newActivityTextField: UITextField!
    
    @IBAction func addPressed(_ sender: Any) {
        
        if (newActivityTextField.text != nil) && newActivityTextField.text != nil  {
            activityList?.append(newActivityTextField.text!)
            newActivityTextField.text = ""
            newActivityTextField.placeholder = "Will you add more activity ?"
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newActivityTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

}

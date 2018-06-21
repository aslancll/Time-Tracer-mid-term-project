//
//  DefaultNavigationController.swift
//  Time Tracer
//
//  Created by Celal Aslan on 2018-06-19.
//  Copyright © 2018 Celal Aslan. All rights reserved.
//

import Foundation

/**
 Custom navigation controller so that we could customise it
 */

class DefaultNavigationController: UINavigationController {
    
    /**
     The preferred status bar style for the view controller.
     
     - returns: UIStatusBarStyle the statusbar style
     */
    //    open func preferredStatusBarStyle() -> UIStatusBarStyle {
    //        return .lightContent
    //    }
    
    /**
     Prepares the receiver for service after it has been loaded from an Interface Builder archive, or nib file.
     Sets the navigation bar and buttons according to iOS system
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        navigationBar.tintColor = UIColor.white
        navigationBar.barTintColor = UIColor.navigationBarColor()
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        view.backgroundColor = UIColor.backgroundColor()
    }
    
}

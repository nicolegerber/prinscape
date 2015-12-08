//
//  Main.swift
//  prinscape3.1
//
//  Created by Nicole Gerber on 12/4/15.
//  Copyright © 2015 Nicole Gerber. All rights reserved.
//

import UIKit

class Main: UIViewController {
    
    @IBOutlet weak var Description: UITextView!
    
    override func viewDidLoad() {
        Description.layer.shadowColor = UIColor.blackColor().CGColor
        Description.layer.shadowOffset = CGSizeMake(1.0, 1.0)
        Description.layer.shadowOpacity = 1.0
        Description.layer.shadowRadius = 1.0
    }

}

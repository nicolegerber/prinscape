// Project: PrinScape
//
// Authors: Nicole Gerber, Amanda Breneman, Caidi Gillett
// Course: CSCI 220 - Programming Languages
// Instructor: John Broere
// Date: 12/9/15
//
// Description: Auto-generated method for when the program view loads
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

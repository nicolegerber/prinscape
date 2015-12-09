// Project: PrinScape
//
// Authors: Nicole Gerber, Amanda Breneman, Caidi Gillett
// Course: CSCI 220 - Programming Languages
// Instructor: John Broere
// Date: 12/9/15
//
// Description: This program provides users with lists of different food, shopping, and activities in area surrounding Principia. The user can click on different entries in the tables and they will be taken to a more detailed view with that establishment's information. There are back buttons for easy navigation between the different tables within the app.
//

import UIKit

class Main: UIViewController {
    
    @IBOutlet weak var Description: UITextView!
    
    override func viewDidLoad() {
        
        //adding drop shadow that can't be added through storyboard
        Description.layer.shadowColor = UIColor.blackColor().CGColor
        Description.layer.shadowOffset = CGSizeMake(1.0, 1.0)
        Description.layer.shadowOpacity = 1.0
        Description.layer.shadowRadius = 1.0
    }

}

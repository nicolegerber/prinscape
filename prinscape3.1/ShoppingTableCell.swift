// Project: PrinScape
//
// Authors: Nicole Gerber, Amanda Breneman, Caidi Gillett
// Course: CSCI 220 - Programming Languages
// Instructor: John Broere
// Date: 12/9/15
//
// Description: This class holds outlets to the three variables that go into the cell on the tableviewcontroller.
//

import UIKit

class ShoppingTableCell: PFTableViewCell {

    //IBOutlets connected to tablecell
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var DistanceLabel: UILabel!
    @IBOutlet weak var ImageView: PFImageView!
    
}

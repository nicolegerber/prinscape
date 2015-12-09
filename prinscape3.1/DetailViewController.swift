// Project: PrinScape
//
// Authors: Nicole Gerber, Amanda Breneman, Caidi Gillett
// Course: CSCI 220 - Programming Languages
// Instructor: John Broere
// Date: 12/9/15
//
// Description: This viewcontroller is the one that opens when you click on one of the cells in the tableviewcontroller. It prints out the name, address, phone number, hours, distance from Prin, price level, and website.
//

import UIKit

class DetailViewController: UIViewController {
    
    //set currentObject to PFObject calling this instance of DetailViewController
    var currentObject : PFObject?
    
    //IBOutlets connected to the DetailViewController storyboard
    @IBOutlet weak var Store: UITextView!
    @IBOutlet weak var Address: UITextView!
    @IBOutlet weak var Phone: UITextView!
    @IBOutlet weak var Hours: UITextView!
    @IBOutlet weak var Distance: UITextField!
    @IBOutlet weak var Expensivity: UITextField!
    @IBOutlet weak var Website: UITextView!
    @IBOutlet weak var Rating: RatingControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Unwrap the current object object
        if let object = currentObject {
            
            //set text views and other text fields to the information in the database
            Store.text = object["Store"] as? String
            Address.text = object["Address"] as? String
            Phone.text = object["Phone"] as? String
            Hours.text = object["Hours"] as? String
            Distance.text = String(object["Distance"] as! Float) + " miles"
            Expensivity.text = "Price: " + String(object["Expensivity"] as! String)
            Website.text = object["Website"] as? String
            let TempRating = object["Rating"] as! Float
            Rating.rating = Int(round(TempRating))
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

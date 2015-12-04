//
//  DetailViewController.swift
//  prinscape3.1
//
//  Created by Nicole Gerber on 11/23/15.
//  Copyright © 2015 Nicole Gerber, Amanda Breneman, Caidi Gillett. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var currentObject : PFObject?

    @IBOutlet weak var Store: UITextView!
    @IBOutlet weak var Address: UITextView!
    @IBOutlet weak var Phone: UITextView!
    @IBOutlet weak var Hours: UITextView!
    @IBOutlet weak var Distance: UITextField!
    @IBOutlet weak var Expensivity: UITextField!
    @IBOutlet weak var Website: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Unwrap the current object object
        if let object = currentObject {
            Store.text = object["Store"] as? String
            Address.text = object["Address"] as? String
            Phone.text = object["Phone"] as? String
            Hours.text = object["Hours"] as? String
            Distance.text = String(object["Distance"] as! Float) + " miles"
            Expensivity.text = "Price: " + String(object["Expensivity"] as! String)
            Website.text = object["Website"] as? String
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

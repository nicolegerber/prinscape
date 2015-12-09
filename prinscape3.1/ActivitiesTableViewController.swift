// Project: PrinScape
//
// Authors: Nicole Gerber, Amanda Breneman, Caidi Gillett
// Course: CSCI 220 - Programming Languages
// Instructor: John Broere
// Date: 12/9/15
//
// Description: This tableviewcontroller holds all of the activities from the Parse database and prints them into a table on the app. This class also creates the segue to the detailviewcontroller.
//

import UIKit

class ActivitiesTableViewController: PFQueryTableViewController {
    
    
    // Initialize the PFQueryTable tableview
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        // Configure the PFQueryTableView
        self.parseClassName = "Database"
        self.textKey = "Store"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery {
        var query = PFQuery(className: "Database")
        query.orderByAscending("Distance")
        query.whereKey("Category", equalTo: "Activity")
        return query
    }
    
    //override the existing tableView function with custom informaiton
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> ActivitiesTableCell {
        
        var ActivityCell = tableView.dequeueReusableCellWithIdentifier("ActivityCell") as! ActivitiesTableCell!
        if ActivityCell == nil {
            ActivityCell = ActivitiesTableCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ActivityCell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if let Name = object?["Store"] as? String {
            ActivityCell?.NameLabel?.text = Name
        }
        if let Distance = object?["Distance"] as? Double {
            ActivityCell?.DistanceLabel?.text = String(Distance) + " miles"
        }
        
        if let Photo = object?["Photo"] as? PFFile {
            ActivityCell?.ImageView?.file = Photo
            ActivityCell?.ImageView?.loadInBackground()
        }
        
        return ActivityCell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using [segue destinationViewController].
        var detailScene = segue.destinationViewController as! DetailViewController
        
        // Pass the selected object to the destination view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let row = Int(indexPath.row)
            detailScene.currentObject = (objects?[row] as! PFObject)
        }
    }

    


}

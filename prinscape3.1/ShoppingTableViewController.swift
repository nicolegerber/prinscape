//
//  ShoppingTableViewController.swift
//  prinscape3.1
//
//  Created by Nicole Gerber on 11/23/15.
//  Copyright © 2015 Nicole Gerber, Amanda Breneman, Caidi Gillett. All rights reserved.
//

import UIKit

class ShoppingTableViewController: PFQueryTableViewController {
    
    
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
        query.whereKey("Category", equalTo: "Shopping")
        return query
    }
    
    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> ShoppingTableCell {
        
        var ShoppingCell = tableView.dequeueReusableCellWithIdentifier("ShoppingCell") as! ShoppingTableCell!
        if ShoppingCell == nil {
            ShoppingCell = ShoppingTableCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ShoppingCell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if let Name = object?["Store"] as? String {
            ShoppingCell?.NameLabel?.text = Name
        }
        if let Distance = object?["Distance"] as? Double {
           ShoppingCell?.DistanceLabel?.text = String(Distance) + " miles"
        }
        
        if let Photo = object?["Photo"] as? PFFile {
            ShoppingCell?.ImageView?.file = Photo
            ShoppingCell?.ImageView?.loadInBackground()
        }
        
        return ShoppingCell
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

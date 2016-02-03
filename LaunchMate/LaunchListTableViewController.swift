//
//  LaunchListTableViewController.swift
//  LaunchMate
//
//  Created by Tejasvi on 1/27/16.
//  Copyright © 2016 Tejasvi. All rights reserved.
//

import Foundation
import UIKit

class LaunchListTableViewController: UITableViewController {
    
    // fetch the launch data before the view appears
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // fetch the launch data if it hasn't already been fetched
        if (LaunchDataFetcher.tenLaunchesData!.count == 0){
            LaunchDataFetcher.fetchLaunchList(LaunchDataFetcher.NEXT_TEN_LAUNCHES_URL)
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return LaunchDataFetcher.tenLaunchesData!.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{

        // dequeue a table view cell and assign an identifier
        let cellIdentifier = "LaunchListTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! LaunchListTableViewCell
        
        // get the appropriate launch data from the array in the data fetcher
        let launchData = LaunchDataFetcher.tenLaunchesData![indexPath.row]
        
        // set the text on the cell
        cell.rocketLabel.text = launchData.rocket!
        cell.missionLabel.text = launchData.mission!
        cell.dateLabel.text = launchData.netDate!
        
        return cell;
    }
    
}

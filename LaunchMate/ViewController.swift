//
//  ViewController.swift
//  LaunchMate
//
//  Created by Tejasvi on 1/27/16.
//  Copyright © 2016 Tejasvi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        // fetch the launch data
        LaunchDataFetcher.fetchLaunchList(LaunchDataFetcher.NEXT_TEN_LAUNCHES_URL)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if LaunchDataFetcher.tenLaunchesData == nil{
            // TODO: Show error alert when launch data is nil
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


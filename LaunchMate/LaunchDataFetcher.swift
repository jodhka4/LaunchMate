//
//  LaunchDataFetcher.swift
//  Launch Mate
//
//  Created by Tejasvi on 1/27/16.
//  Copyright © 2016 Tejasvi. All rights reserved.
//
//  Singleton class for handling http requests for launch data

import Foundation

class LaunchDataFetcher {
    private init(){}
    
    // static sharedInstance to make it a singleton, with a private init
    static let sharedInstance = LaunchDataFetcher()
    
    // URLs for different types of requests
    static let NEXT_TEN_LAUNCHES_URL = "https://launchlibrary.net/1.1/launch"
    
    // launch data
    static var tenLaunchesData : [(rocket: String?, mission: String?, netDate: String?)]? = []
    
    /**
     Main launch data fetching method, storing in class level static member.
     @param dataURL: String. Contains the URL to fetch the launch data from. Valid URLs are class constants. 
     @return Void.
     */
    static func fetchLaunchList(dataURL: String){
        
        // convert string URL to NSURL, and get the semaphore for performing the request
        let url = NSURL(string: dataURL)
        let sem = dispatch_semaphore_create(0)
        var responseData = NSData()
        
        // access the session singleton and execute the request, saving the data in responseData, then wait for the task to finish
        NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {(data, response, error) -> Void in
            if let d = data{
                responseData = d
                dispatch_semaphore_signal(sem)
            }
        }).resume()
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER)
        
        // array of tuples to save launch data - holds name, net launch date, and rocket name
        var jsonData: NSDictionary?
        
        do{
            // deserialize the NSData as json
            jsonData = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions()) as? NSDictionary
            
            // parse the launch data, using the key "launches"
            if let launches = jsonData!["launches"] as? [[String: AnyObject]]{
                for launch in launches{
                    
                    // temp tuple to add to the dictionary
                    var temp: (String?, String?, String?)
                    
                    // get name and rocket type, using "name" key
                    if let name = launch["name"] as? String{
                        temp.0 = name.componentsSeparatedByString("|")[0]
                        temp.1 = name.componentsSeparatedByString("|")[1]
                    }
                    
                    // get net date using "net" key
                    if let date = launch["net"] as? String{
                        temp.2 = date
                    }
                    
                    tenLaunchesData!.append(temp)
                }
            }
            print("parsed")
            
            for (a, b, c) in tenLaunchesData!{
                print(a!)
                print(b!)
                print(c!)
                print("")
            }
            
        } catch {
            print(error)
        }
    }
}














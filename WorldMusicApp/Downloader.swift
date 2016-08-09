//
//  Downloader.swift
//  WorldMusicApp
//
//  Created by Era Iyer on 8/9/16.
//  Copyright © 2016 Era Iyer. All rights reserved.
//

import Foundation
class Downloader {
    class func load(URL: NSURL) {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        let request = NSMutableURLRequest(URL: URL)
        request.HTTPMethod = "GET"
        let task = session.dataTaskWithRequest(request, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! NSHTTPURLResponse).statusCode
                print("Success: \(statusCode)")
                
                // This is your file-variable:
                // data
            }
            else {
                // Failure
                print("Failure: %@", error!.localizedDescription);
            }
        })
        task.resume()
    }
}

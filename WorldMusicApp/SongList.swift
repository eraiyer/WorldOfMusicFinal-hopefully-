//
//  SongList.swift
//  WorldMusicApp
//
//  Created by Era Iyer on 7/18/16.
//  Copyright © 2016 Era Iyer. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AVFoundation
import RealmSwift


class songList: UITableViewController{
    var idArray: [String] = []
    var previewArray: [realmString] = []
    var songsArray: [realmString] = []
    var downloadUrls = [realmString?](count:3, repeatedValue: nil)
    
    var favSongs: [String] = []
    var cellIndex = 0
    var country: String = ""
    var countryNoPlus: String = ""
    
    let PlayerStatusObservingContext = UnsafeMutablePointer<Void>(bitPattern: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationController?.navigationBar.tintColor = UIColor(red:0.72, green:0.91, blue:0.86, alpha:1.0);
        self.navigationController?.navigationBarHidden = false
        storeIdNumbers()
    }
    
func storeIdNumbers() {
    //getting the ID number of each album of the country and adding it to an array

    if country == "Myanmar+(Burma)" {
    
        let apiToContact = "https://api.spotify.com/v1/search?q=music+from+burma&type=album"
        Alamofire.request(.GET, apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    var counter = 0
                    for(_,_) in json["albums"]{
                        if let albumID = json["albums"]["items"][counter]["id"].string {
                            var albumLinkWithID = "https://api.spotify.com/v1/albums/\(albumID)/tracks"
                            self.idArray.append(albumLinkWithID)
                            
                            counter+=1
                        }
                    }
                    self.tableView.reloadData()
                 //   self.storePreviewUrl()
                    self.storeSongsAndUrl()
                    break
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    else if country == "United+Kingdom" {
        let apiToContact = "https://api.spotify.com/v1/search?q=british&type=album"
        Alamofire.request(.GET, apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    var counter = 0
                    for(_,_) in json["albums"]{
                        if let albumID = json["albums"]["items"][counter]["id"].string {
                            var albumLinkWithID = "https://api.spotify.com/v1/albums/\(albumID)/tracks"
                            self.idArray.append(albumLinkWithID)
                            counter+=1
                        }
                    }
                    self.tableView.reloadData()
           //         self.storePreviewUrl()
                    self.storeSongsAndUrl()
                    break
                }
            case .Failure(let error):
                print(error)
            }
        }
        
    }
    if country == "United+States" {
        //let apiToContact = "https://api.spotify.com/v1/search?q=rock+music&type=album"
        let apiToContact = "https://api.spotify.com/v1/search?q=2015+songs&type=album"
        Alamofire.request(.GET, apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    var counter = 0
                     print(json["albums"])
                    for(_,_) in json["albums"]{
                        if let albumID = json["albums"]["items"][counter]["id"].string {
                            var albumLinkWithID = "https://api.spotify.com/v1/albums/\(albumID)/tracks"
                            self.idArray.append(albumLinkWithID)
                            counter+=1
                        }
                    }
                    self.storeSongsAndUrl()
                    self.tableView.reloadData()
                    //self.storePreviewUrl()
                    break
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
   else if country == "Iceland" {
        let apiToContact = "https://api.spotify.com/v1/search?q=iceland&type=album"
        Alamofire.request(.GET, apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    var counter = 0
                    for(_,_) in json["albums"]{
                        if let albumID = json["albums"]["items"][counter]["id"].string {
                            var albumLinkWithID = "https://api.spotify.com/v1/albums/\(albumID)/tracks"
                            self.idArray.append(albumLinkWithID)
                            counter+=1
                        }
                    }
                    self.tableView.reloadData()
                  //  self.storePreviewUrl()
                    self.storeSongsAndUrl()
                    break
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    else if country == "North+Korea" || country == "South+Korea" {
        let apiToContact = "https://api.spotify.com/v1/search?q=music+from+korea&type=album"
        Alamofire.request(.GET, apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    var counter = 0
                    // print(json["albums"])
                    for(_,_) in json["albums"]{
                        if let albumID = json["albums"]["items"][counter]["id"].string {
                            var albumLinkWithID = "https://api.spotify.com/v1/albums/\(albumID)/tracks"
                            self.idArray.append(albumLinkWithID)
                            counter+=1
                        }
                    }
                    
                    self.tableView.reloadData()
                    //self.storePreviewUrl()
                    self.storeSongsAndUrl()
                    break
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    else if country == "Bahamas" {
        let apiToContact = "https://api.spotify.com/v1/search?q=bahamas&type=album"
        Alamofire.request(.GET, apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    var counter = 0
                    // print(json["albums"])
                    for(_,_) in json["albums"]{
                        if let albumID = json["albums"]["items"][counter]["id"].string {
                            var albumLinkWithID = "https://api.spotify.com/v1/albums/\(albumID)/tracks"
                            self.idArray.append(albumLinkWithID)
                            counter+=1
                        }
                    }
                    
                    self.tableView.reloadData()
                    //self.storePreviewUrl()
                    self.storeSongsAndUrl()
                    break
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
        
    else {
        let apiToContact = "https://api.spotify.com/v1/search?q=music+from+\(country)&type=album"
        Alamofire.request(.GET, apiToContact).validate().responseJSON() { response in
                switch response.result {
                    case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                    var counter = 0
                       // print(json["albums"])
                        for(_,_) in json["albums"]{
                            if let albumID = json["albums"]["items"][counter]["id"].string {
                                var albumLinkWithID = "https://api.spotify.com/v1/albums/\(albumID)/tracks"
                                self.idArray.append(albumLinkWithID)
                                counter+=1
                            }
                        }
                      
                        self.storeSongsAndUrl()
                         self.tableView.reloadData()
                      // self.storePreviewUrl()
                       
                       break
                    }
                case .Failure(let error):
            print(error)
            }
        }
    }
}

   func storeSongsAndUrl(){
        self.songsArray = []
        var idCounter =  0
        while idCounter < self.idArray.count {
            let apiToContact = self.idArray[idCounter]
            Alamofire.request(.GET, apiToContact).validate().responseJSON() { response in
                switch response.result {
                    case .Success:
                        if let value = response.result.value {
                            let json = JSON(value)
                            var urlCounter = 0
                            var songCounter = 0
                            for(_, _) in json["items"]{
                                if let songs = json["items"][songCounter]["name"].string {
                                    self.songsArray.append(realmString(string: songs))
                                    songCounter += 1
                                }
                                if let previewUrl = json["items"][urlCounter]["preview_url"].string {
                                    self.previewArray.append(realmString(string: previewUrl))
                                    urlCounter += 1
                                }

                            }
                            self.tableView.reloadData()
                            break
                    }
                case .Failure(let error):
                    print(error)
                }
            }
            idCounter += 1
    }
 }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return songsArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
        
        cell.textLabel?.text = songsArray[indexPath.row].stringValue
        
        cell.textLabel!.textColor =  UIColor(red:0.72, green:0.91, blue:0.86, alpha:1.0)
        cell.textLabel?.font = UIFont.boldSystemFontOfSize(17.0)
        cell.textLabel?.font = UIFont (name: "Helvetica Neue", size: 15)
        
        cell.backgroundColor = .clearColor()
        cell.imageView!.hidden = false
        
        if previewArray.count > 0 {
        cell.prevUrl = previewArray[indexPath.row].stringValue
        if cell.prevUrl == previewArray[cellIndex].stringValue {
            cell.textLabel!.textColor = UIColor(red:0.69, green:0.90, blue:0.49, alpha:1.0)
        }
    }
        
        return cell
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        cellIndex = indexPath.row
        tableView.reloadData()
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        playSongs()
    }
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        countryNoPlus = "\(country)".stringByReplacingOccurrencesOfString("+", withString: " ")
        let label = UILabel(frame: CGRectMake(0, 0, tableView.frame.size.width, 30.0))
        label.text = countryNoPlus
        label.textAlignment = .Center
        label.font = UIFont.boldSystemFontOfSize(19.0)
        label.font = UIFont (name: "Helvetica Neue", size: 20)
        label.textColor =  UIColor(red:0.72, green:0.91, blue:0.86, alpha:1.0)
        label.backgroundColor = UIColor.blackColor()
        return label
    }

    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    
   func playSongs() {
        self.tableView.reloadData()
        /*let url = previewArray[cellIndex].stringValue
        let playerItem = AVPlayerItem( URL:NSURL( string:url )! )
        player = AVPlayer(playerItem:playerItem)
        player.rate = 1.0
        player.play()*/
    
      //  print("duration: \(playerItem.duration)")
    
   /* player.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions.New, context: nil)
    player.addObserver(self, forKeyPath: "rate", options: NSKeyValueObservingOptions.New, context: nil)*/
    
    let urlstring = previewArray[cellIndex].stringValue
    let url = NSURL(string: urlstring)
    print("the url = \(url!)")
    downloadFileFromURL(url!)
    
    }
    
    func downloadFileFromURL(url:NSURL){
        var downloadTask:NSURLSessionDownloadTask
       // downloadTask = NSURLSession.sharedSession().downloadTaskWithURL(url, completionHandler: { (URL, response, error) -> Void in
        downloadTask = NSURLSession.sharedSession().downloadTaskWithURL(url, completionHandler: { (URL, response, error) -> Void in
            print("error: \(error)")

            let changeToMp3 = "\(URL)".stringByReplacingOccurrencesOfString(".tmp", withString: ".mp3")
            /*do {
                let documentDirectory = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0])
                let originPath = documentDirectory.URLByAppendingPathComponent("/URL")
                let destinationPath = documentDirectory.URLByAppendingPathComponent("/changeToMp3.mp3")
                try NSFileManager.defaultManager().moveItemAtURL(originPath, toURL: destinationPath)
            } catch let error as NSError {
                print(error)
            }
            
            let fileManager = NSFileManager.defaultManager()
            do {
                try fileManager.moveItemAtPath("\(URL?.absoluteString)", toPath: "\(changeToMp3)")
                
            }
            catch let error as NSError {
                print("Ooops! Something went wrong: \(error)")
            }*/
            
            self.play(URL!)
        })
        
        downloadTask.resume()
        
    }
    
    var player = AVPlayer()
    var audioPlayer: AVAudioPlayer!
    
    func play(url:NSURL) {
        print("playing \(url)")
        
        /*do {
            self.player = try AVPlayer(URL: url)
            
            player.rate = 1.0
            player.play()
            print("playing")
        } catch let error as NSError {
            //self.player = nil
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }*/
        let testURL = NSURL(fileURLWithPath: "/Users/eraiyer/Desktop/sampleSong.mp3")
        
        audioPlayer = try! AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }
    
    /*var player: AVAudioPlayer?

    func playSongs() {
      let audioUrl = NSURL(fileURLWithPath: String(previewArray[cellIndex].stringValue))
        if audioUrl == NSURL(fileURLWithPath: String(previewArray[cellIndex].stringValue)) {
        // then lets create your document folder url
        let documentsDirectoryURL =  NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        
        // lets create your destination file url
        let destinationUrl = documentsDirectoryURL.URLByAppendingPathComponent(audioUrl.lastPathComponent ?? "audio.mp3")
        print(destinationUrl)
        
        // to check if it exists before downloading it
        if NSFileManager().fileExistsAtPath(destinationUrl.path!) {
            print("The file already exists at path")
            
            // if the file doesn't exist
        }
        else {
            
            // you can use NSURLSession.sharedSession to download the data asynchronously
            NSURLSession.sharedSession().downloadTaskWithURL(audioUrl, completionHandler: { (location, response, error) -> Void in
                guard let loc = location where error == nil else { return }
                do {
                    // after downloading your file you need to move it to your destination url
                    try NSFileManager().moveItemAtURL(loc, toURL: destinationUrl)
                    print("File moved to documents folder")
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }).resume()
        }
    }
}*/
    
    var songUrl: songsUrls?
    
    @IBAction func addToFavs(sender: AnyObject) {
        let songUrl = songsUrls()
        songUrl.favoriteUrls.append(previewArray[cellIndex])
        songUrl.favoriteSongs.append(songsArray[cellIndex])
        songUrl.countryName.append(realmString(string: countryNoPlus))
         RealmHelper.addFavUrls(songUrl)
        }
    
    
   /* override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
        
        if (keyPath == "status") {
            print(player.status)
        }
    }
    
    private func deallocObservers(player: AVPlayer) {
        player.removeObserver(self, forKeyPath: "status")
        //player.removeObserver(self, forKeyPath: "rate")
    }*/
    
}


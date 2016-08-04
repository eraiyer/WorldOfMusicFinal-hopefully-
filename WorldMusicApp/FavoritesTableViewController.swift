//
//  FavoritesTableViewController.swift
//  WorldMusicApp
//
//  Created by Era Iyer on 7/28/16.
//  Copyright © 2016 Era Iyer. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation
import RealmSwift

class FavoritesViewController: UIViewController {
    var favouriteUrls: [realmString] = []
    var favouriteSongs: [realmString] = []
    var countryNames: [realmString] = []
    var favSongs = RealmHelper.retrieveFavs()
    var cellIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor(red:0.72, green:0.91, blue:0.86, alpha:1.0);
        self.navigationController?.navigationBarHidden = false
        
        var counter = 0
        while counter < favSongs.count {
            let song = realmString(string: favSongs[counter].favoriteSongs[0].stringValue)
            favouriteSongs.append(song)
            
            let url = realmString(string: favSongs[counter].favoriteUrls[0].stringValue)
            favouriteUrls.append(url)
            
            let country = realmString(string: favSongs[counter].countryName[0].stringValue)
            countryNames.append(country)
            
            counter+=1
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var player = AVPlayer()
    
    func playSongs() {
        let url = favouriteUrls[cellIndex].stringValue
        let playerItem = AVPlayerItem( URL:NSURL( string: url )! )
        player = AVPlayer(playerItem:playerItem)
        player.rate = 1.0
        player.play()
    }

}

extension FavoritesViewController: UITableViewDataSource {
    

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteSongs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("favCell", forIndexPath: indexPath) as! CustomCell
        if countryNames[indexPath.row].stringValue == "" {
            countryNames[indexPath.row].stringValue =  "United States"
        }
        
        cell.textLabel?.text = "(" + countryNames[indexPath.row].stringValue + ") " + favouriteSongs[indexPath.row].stringValue
        cell.textLabel!.textColor =  UIColor(red:0.72, green:0.91, blue:0.86, alpha:1.0)
        cell.textLabel?.font = UIFont.boldSystemFontOfSize(17.0)
        cell.textLabel?.font = UIFont (name: "Euphemia UCAS", size: 15)
        
        cell.favUrl = favouriteUrls[indexPath.row].stringValue
        if cell.favUrl == favouriteUrls[cellIndex].stringValue {
            cell.textLabel!.textColor = UIColor(red:0.69, green:0.90, blue:0.49, alpha:1.0)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRectMake(0, 0, tableView.frame.size.width, 30.0))
        label.text = "Favorites"
        label.textAlignment = .Center
        label.font = UIFont.boldSystemFontOfSize(19.0)
        label.font = UIFont (name: "Euphemia UCAS", size: 20)
        label.textColor =  UIColor(red:0.72, green:0.91, blue:0.86, alpha:1.0)
        label.backgroundColor = UIColor.blackColor()
        return label
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        cellIndex = indexPath.row
        tableView.reloadData()
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        playSongs()
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            favouriteUrls.removeAtIndex(indexPath.row)
            favouriteSongs.removeAtIndex(indexPath.row)
            RealmHelper.deleteNote(favSongs[indexPath.row])
            favSongs = RealmHelper.retrieveFavs()
            tableView.reloadData()
        }
    }
    
}
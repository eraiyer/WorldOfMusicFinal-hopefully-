//
//  SongsUrls.swift
//  WorldMusicApp
//
//  Created by Era Iyer on 8/1/16.
//  Copyright © 2016 Era Iyer. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class songsUrls: Object {

    var favoriteSongs = List<realmString>()
    var favoriteUrls = List<realmString>()
    var countryName = List<realmString>()
}

class realmString : Object {
    dynamic var stringValue : String = ""
    
    convenience init(string:String) {
        self.init()
        self.stringValue = string
    }
}


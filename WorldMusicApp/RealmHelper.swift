//
//  RealmHelper.swift
//  WorldMusicApp
//
//  Created by Era Iyer on 8/1/16.
//  Copyright © 2016 Era Iyer. All rights reserved.
//

import Foundation

import RealmSwift

class RealmHelper {
    
    static func addFavUrls (favs: songsUrls) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(favs)
        }
    }
    
    static func updateFavs(favsToBeUpdated: songsUrls, newFavs: songsUrls) {
        let realm = try! Realm()
        try! realm.write() {
            favsToBeUpdated.favoriteUrls = newFavs.favoriteUrls
            favsToBeUpdated.favoriteSongs = newFavs.favoriteSongs
            favsToBeUpdated.countryName = newFavs.countryName
        }
    }
    static func deleteNote(favs: songsUrls) {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(favs)
        }
    }
    static func retrieveFavs() -> Results<songsUrls> {
        let realm = try! Realm()
        return realm.objects(songsUrls)
    }
}
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
    
    /*static func addNote(note: Note) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(note)
        }
    }
    static func deleteNote(note: Note) {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(note)
        }
    }
    
    static func retrieveNotes() -> Results<Note> {
        let realm = try! Realm()
        return realm.objects(Note)
    }*/
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
        }
    }
    
    static func retrieveFavs() -> Results<songsUrls> {
        let realm = try! Realm()
        return realm.objects(songsUrls)
    }
}
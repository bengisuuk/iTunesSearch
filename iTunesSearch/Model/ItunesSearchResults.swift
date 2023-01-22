//
//  resultsArr.swift
//  iTunesSearch
//
//  Created by Bengisu Karakılınç on 9.01.2021.
//

import Foundation

struct  ItunesSearchResults : Codable {
    

    //let wrapperType: String
   // let kind: String
    //let artistId: Int
    // let collectionId: Int
    //let  trackId: Int
    //let  artistName: String
    var wrapperType : String?
    var  collectionName: String?
   // let  trackName: String
   // let  collectionCensoredName: String
   // let  trackCensoredName: String
   // let   artistViewUrl: String
   // let  collectionViewUrl: String
   // let  trackViewUrl: String
   // let  previewUrl: String
   // let  artworkUrl30: String
   // let artworkUrl60: String
    var  artworkUrl100: String?
    var  collectionPrice: Double?
  //public   let    trackPrice: Int
    var   releaseDate: String?
  //  let  collectionExplicitness: String
  //  let   trackExplicitness: String
  //  let   discCount: Int
  //  let  discNumber: Int
  //  let  trackCount: Int
  //  let  trackNumber: Int
  //  let trackTimeMillis: Int
  //  let country: String
  //  let  currency: String
  //  let  primaryGenreName: String
  //  let  isStreamable: Bool
    
    
    //init(json: [String: Any]){
    //    collectionName = json["collectionName"] as? String ?? ""
    //    artworkUrl100 =  json["artworkUrl100"] as? String ?? ""
    //    collectionPrice =  json["collectionPrice"] as? Double ?? 0.0
    //    releaseDate =  json["releaseDate"] as? String ?? ""

    //}
    
}

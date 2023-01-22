// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
class AlbumResult: Decodable {
    let resultCount: Int
    let results: [AlbumModel]

    init(resultCount: Int, results: [AlbumModel]) {
        self.resultCount = resultCount
        self.results = results
    }
}

// MARK: - Result
class AlbumModel: Decodable {
    let wrapperType, collectionType: String
    let artistID, collectionID: Int
    let amgArtistID: Int?
    let artistName, collectionName, collectionCensoredName: String
    let artistViewURL: String?
    let collectionViewURL: String
    let artworkUrl60, artworkUrl100: String
    let collectionPrice: Double?
    let collectionExplicitness: String
    let trackCount: Int
    let copyright, country, currency: String
    let releaseDate: String
    let primaryGenreName: String

    enum CodingKeys: String, CodingKey {
            case wrapperType, collectionType
            case artistID = "artistId"
            case collectionID = "collectionId"
            case amgArtistID = "amgArtistId"
            case artistName, collectionName, collectionCensoredName
            case artistViewURL = "artistViewUrl"
            case collectionViewURL = "collectionViewUrl"
            case artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, trackCount, copyright, country, currency, releaseDate, primaryGenreName
    }
    
    init(wrapperType: String, collectionType: String, artistID: Int, collectionID: Int, amgArtistID: Int?, artistName: String, collectionName: String, collectionCensoredName: String, artistViewURL: String?, collectionViewURL: String, artworkUrl60: String, artworkUrl100: String, collectionPrice: Double?, collectionExplicitness: String, trackCount: Int, copyright: String, country: String, currency: String, releaseDate: String, primaryGenreName: String) {
            self.wrapperType = wrapperType
            self.collectionType = collectionType
            self.artistID = artistID
            self.collectionID = collectionID
            self.amgArtistID = amgArtistID
            self.artistName = artistName
            self.collectionName = collectionName
            self.collectionCensoredName = collectionCensoredName
            self.artistViewURL = artistViewURL
            self.collectionViewURL = collectionViewURL
            self.artworkUrl60 = artworkUrl60
            self.artworkUrl100 = artworkUrl100
            self.collectionPrice = collectionPrice
            self.collectionExplicitness = collectionExplicitness
            self.trackCount = trackCount
            self.copyright = copyright
            self.country = country
            self.currency = currency
            self.releaseDate = releaseDate
            self.primaryGenreName = primaryGenreName
    }
}



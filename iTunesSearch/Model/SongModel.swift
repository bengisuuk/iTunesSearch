//
//  SongModel.swift
//  iTunesSearch
//
//  Created by Bengisu Karakılınç on 12.12.2022.
//
import Foundation

// MARK: - Welcome
class SongResult: Decodable {
    let resultCount: Int
    let results: [SongModel]

    init(resultCount: Int, results: [SongModel]) {
        self.resultCount = resultCount
        self.results = results
    }
}

// MARK: - Result
class SongModel: Codable {
    let wrapperType: String
    let kind: String
    let artistID, collectionID, trackID: Int
    let artistName, collectionName, trackName, collectionCensoredName: String
    let trackCensoredName: String
    let artistViewURL, collectionViewURL, trackViewURL: String
    let previewURL: String
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice, trackPrice: Double
    let releaseDate: Date
    let collectionExplicitness, trackExplicitness: String
    let discCount, discNumber, trackCount, trackNumber: Int
    let trackTimeMillis: Int
    let country: String
    let currency: String
    let primaryGenreName: String
    let isStreamable: Bool
    let collectionArtistName: String?
    let collectionArtistID: Int?
    let collectionArtistViewURL: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, isStreamable, collectionArtistName
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
    }

    init(wrapperType: String, kind: String, artistID: Int, collectionID: Int, trackID: Int, artistName: String, collectionName: String, trackName: String, collectionCensoredName: String, trackCensoredName: String, artistViewURL: String, collectionViewURL: String, trackViewURL: String, previewURL: String, artworkUrl30: String, artworkUrl60: String, artworkUrl100: String, collectionPrice: Double, trackPrice: Double, releaseDate: Date, collectionExplicitness: String, trackExplicitness: String, discCount: Int, discNumber: Int, trackCount: Int, trackNumber: Int, trackTimeMillis: Int, country: String, currency: String, primaryGenreName: String, isStreamable: Bool, collectionArtistName: String?, collectionArtistID: Int?, collectionArtistViewURL: String?) {
        self.wrapperType = wrapperType
        self.kind = kind
        self.artistID = artistID
        self.collectionID = collectionID
        self.trackID = trackID
        self.artistName = artistName
        self.collectionName = collectionName
        self.trackName = trackName
        self.collectionCensoredName = collectionCensoredName
        self.trackCensoredName = trackCensoredName
        self.artistViewURL = artistViewURL
        self.collectionViewURL = collectionViewURL
        self.trackViewURL = trackViewURL
        self.previewURL = previewURL
        self.artworkUrl30 = artworkUrl30
        self.artworkUrl60 = artworkUrl60
        self.artworkUrl100 = artworkUrl100
        self.collectionPrice = collectionPrice
        self.trackPrice = trackPrice
        self.releaseDate = releaseDate
        self.collectionExplicitness = collectionExplicitness
        self.trackExplicitness = trackExplicitness
        self.discCount = discCount
        self.discNumber = discNumber
        self.trackCount = trackCount
        self.trackNumber = trackNumber
        self.trackTimeMillis = trackTimeMillis
        self.country = country
        self.currency = currency
        self.primaryGenreName = primaryGenreName
        self.isStreamable = isStreamable
        self.collectionArtistName = collectionArtistName
        self.collectionArtistID = collectionArtistID
        self.collectionArtistViewURL = collectionArtistViewURL
    }
}

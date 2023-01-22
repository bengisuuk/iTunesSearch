//
//  MovieModel.swift
//  iTunesSearch
//
//  Created by Bengisu Karakılınç on 12.12.2022.
//

import Foundation

// MARK: - Welcome
class MovieResult: Decodable {
    let resultCount: Int
    let results: [MovieModel]

    init(resultCount: Int, results: [MovieModel]) {
        self.resultCount = resultCount
        self.results = results
    }
}

// MARK: - Result
class MovieModel: Decodable {
    let wrapperType, kind: String
    let artistID: Int?
    let trackID: Int
    let artistName, trackName, trackCensoredName: String
    let artistViewURL: String?
    let trackViewURL: String
    let previewURL: String
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice, trackPrice: Double
    let trackRentalPrice, collectionHDPrice, trackHDPrice, trackHDRentalPrice: Double?
    let releaseDate: Date
    let collectionExplicitness, trackExplicitness: String
    let trackTimeMillis: Int
    let country, currency, primaryGenreName, contentAdvisoryRating: String
    let shortDescription, longDescription: String

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case trackID = "trackId"
        case artistName, trackName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription
    }

    init(wrapperType: String, kind: String, artistID: Int?, trackID: Int, artistName: String, trackName: String, trackCensoredName: String, artistViewURL: String?, trackViewURL: String, previewURL: String, artworkUrl30: String, artworkUrl60: String, artworkUrl100: String, collectionPrice: Double, trackPrice: Double, trackRentalPrice: Double?, collectionHDPrice: Double?, trackHDPrice: Double?, trackHDRentalPrice: Double?, releaseDate: Date, collectionExplicitness: String, trackExplicitness: String, trackTimeMillis: Int, country: String, currency: String, primaryGenreName: String, contentAdvisoryRating: String, shortDescription: String, longDescription: String) {
        self.wrapperType = wrapperType
        self.kind = kind
        self.artistID = artistID
        self.trackID = trackID
        self.artistName = artistName
        self.trackName = trackName
        self.trackCensoredName = trackCensoredName
        self.artistViewURL = artistViewURL
        self.trackViewURL = trackViewURL
        self.previewURL = previewURL
        self.artworkUrl30 = artworkUrl30
        self.artworkUrl60 = artworkUrl60
        self.artworkUrl100 = artworkUrl100
        self.collectionPrice = collectionPrice
        self.trackPrice = trackPrice
        self.trackRentalPrice = trackRentalPrice
        self.collectionHDPrice = collectionHDPrice
        self.trackHDPrice = trackHDPrice
        self.trackHDRentalPrice = trackHDRentalPrice
        self.releaseDate = releaseDate
        self.collectionExplicitness = collectionExplicitness
        self.trackExplicitness = trackExplicitness
        self.trackTimeMillis = trackTimeMillis
        self.country = country
        self.currency = currency
        self.primaryGenreName = primaryGenreName
        self.contentAdvisoryRating = contentAdvisoryRating
        self.shortDescription = shortDescription
        self.longDescription = longDescription
    }
}

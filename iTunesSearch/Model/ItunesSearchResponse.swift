//
//  APIResult.swift
//  iTunesSearch
//
//  Created by Bengisu Karakılınç on 9.01.2021.
//

import Foundation

struct ItunesSearchResponse: Codable {
    let resultCount : Int?
    let results : [ItunesSearchResults]?
}

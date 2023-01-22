//
//  APIResult.swift
//  iTunesSearch
//
//  Created by Bengisu Karakılınç on 9.01.2021.
//

import Foundation

struct APIResult : Decodable {
    let resultCount : Int
    let results : [resultsArr]
}

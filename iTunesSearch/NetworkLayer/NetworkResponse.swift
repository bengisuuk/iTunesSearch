//
//  NetworkResponse.swift
//  iTunesSearch
//
//  Created by Bengisu Karakılınç on 29.06.2022.
//

import Foundation

enum NetworkResponse <T> {
    case success(T)
    case failure(NetworkError)
    case error(ErrorModel)
}

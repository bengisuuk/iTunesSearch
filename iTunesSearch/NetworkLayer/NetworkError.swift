//
//  NetworkError.swift
//  iTunesSearch
//
//  Created by Bengisu Karakılınç on 29.06.2022.
//

import Foundation

enum NetworkError: Swift.Error {
    case customError
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self{
        case .customError:
           return "General Error"
        }
    }
}

struct ErrorResponseModel: Codable {
    var error: ErrorModel?
}

struct ErrorModel: Codable {
    var code: String?
    var message: String?
    var desc: String?
    var errorId: Int?
    var status: Int?
}

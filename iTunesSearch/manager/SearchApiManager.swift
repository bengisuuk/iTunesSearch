//
//  SearchApiManager.swift
//  iTunesSearch
//
//  Created by Bengisu Karakılınç on 12.12.2022.
//

import UIKit

extension ApiManager {
    func getAlbumOnItunes(term: String, entity: String, completion: @escaping (NetworkResponse<AlbumResult>) -> ()) {
        var params = [String: String]()
        params["term"] = "\(term)"
        params["entity"] = "\(entity)"
        params["limit"] = "20"
        ApiManager.shared.getRequest(type: AlbumResult.self, endpoint: .term, parameters: params) { (response) in
            completion(response)
        }
    }
}

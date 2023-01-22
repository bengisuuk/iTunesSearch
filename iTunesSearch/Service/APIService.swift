//
//  APIService.swift
//  iTunesSearch
//
//  Created by Bengisu Karakılınç on 9.01.2021.
//


import Foundation

class WebService{
    
    static let instance = WebService()
    
    
    //JSOn verisi oluşturulan resultArr'e yazılıyor.
    
    func getData( url: URL, filter : String, completion : @escaping ( [resultsArr] )  -> ()){
        var searchItem = [resultsArr]()
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                print("bu url geliyo \(url)")
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    if let results = json["results"] as? NSArray{
                        for  result in results {
                            if let resultItem = result as? [String: AnyObject]{
                                print(1)
                                print(filter)
                                if resultItem["wrapperType"] as? String == filter {
                                    //wrapperType'ı ilgili horizantal filrenin entity ismine göre filtreleniyor.
                                    print(3)
                                if let collectionName =  resultItem["collectionName"] as? String {

                                    if let artworkUrl100 = resultItem["artworkUrl100"] as? String {

                                        if let collectionPrice = resultItem["collectionPrice"] as? Double {

                                            if  let releaseDate = resultItem["releaseDate"] as? String {
                                                if  let wrapperType = resultItem["wrapperType"] as? String{
                                                    
                                                    
                                                    let temp = resultsArr(wrapperType: wrapperType ,
                                                                          collectionName : collectionName , artworkUrl100 : artworkUrl100 , collectionPrice : collectionPrice , releaseDate : releaseDate)
                                                searchItem.append(temp)
       
                                                }
                                            }
                                        }

                                    }

                                }
                            
                            }
                        }
                            
                        }; completion(searchItem)
                        

                        
                        
                    }
                    
                   // if let searchItem
                }catch {
                print(error.localizedDescription)
            }
            }
            if error != nil {
                print(error!.localizedDescription)
            }
            
        }.resume()
        
        
    }
    
    
}

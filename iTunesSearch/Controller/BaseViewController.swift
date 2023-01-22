//
//  ViewController.swift
//  iTunesSearch
//
//  Created by Bengisu Karakılınç on 7.01.2021.
//

import UIKit

class BaseViewController: UIViewController {

    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //var entity : String = ""
    var entity  = "movie"
    var searchAPI : URL!
    let APIURL = "https://itunes.apple.com/search?"
    var resultArray = [ItunesSearchResults]()
    var selectedResult : ItunesSearchResults!
    var searchData: AlbumResult?
    var searchText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.delegate = self
        searchAPI = URL(string: "\(APIURL)")
        self.getSearchData()
    }
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl){
        
        if sender.selectedSegmentIndex == 0 {
            self.entity = "movie"
        } else if sender.selectedSegmentIndex == 1 {
            self.entity = "music"
        }else if sender.selectedSegmentIndex == 2 {
            self.entity = "software"
        }else if sender.selectedSegmentIndex == 3 {
            self.entity = "ebook"
        }
        self.collectionView.reloadData()
        
      /*  WebService.instance.getData(url: searchAPI , filter: entity) { (results) in
            self.resultArray =  results
            if self.resultArray.count > 0 {
            self.collectionView.reloadData()
            }
        }*/
    }
    //Details VC'e gitmemizi sağlayan Segue. Collection Viewde bir grid'e basılırsa details VC'e aktarılıyor.
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destinationVC = segue.destination as! DetailVC
            destinationVC.result = selectedResult
        }
    }
    
}

extension BaseViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            self.searchText = nil
        }else {
            self.searchText = searchText
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.getSearchData()
    }
    
    func getSearchData(){
        guard let searchText = self.searchText else{ return }
        ApiManager.shared.getAlbumOnItunes(term: searchText,entity: self.entity) { [weak self](result) in
            guard let self = self else {return}
            switch result {
            case let .success(response):
                self.searchData = response
                self.collectionView.reloadData()
            case let .error(error):
                break
            case let .failure(error):
                break
                
            }
        }

    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsSearchResultsButton = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()

    }
}

extension BaseViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.searchData?.resultCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as! ItemCollectionViewCell
        guard let url = URL(string: self.searchData?.results[indexPath.row].artworkUrl60 ?? "") else { return cell }
            let task = URLSession.shared.dataTask(with: url){ (data, response, error)
            in
            if let data = data {
                DispatchQueue.main.async {
                    cell.imageView.image = UIImage(data: data)
                }
            }
        }
        task.resume()
       
        
     //   let url = URL(string: self.resultArray[indexPath.row].artworkUrl100)
       // if let data = try? Data(contentsOf: url!){
         //   DispatchQueue.main.async {
//                cell.configure(with: UIImage(data: data)! )

  //          }
    //    }
     return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        selectedResult = resultArray[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)

    }
}

//
//  ViewController.swift
//  iTunesSearch
//
//  Created by Bengisu Karakılınç on 7.01.2021.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout,UISearchBarDelegate {

    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //var entity : String = ""
    var entity  = "track"
    var searchAPI : URL!
    let APIURL = "https://itunes.apple.com/search?"
    var resultArray = [resultsArr]()
    var selectedResult : resultsArr!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout
        collectionView.register(ItemCollectionViewCell.nib(), forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.delegate = self
        searchAPI = URL(string: "\(APIURL)")


    }

    //search barda kelime değişikliği olduğunda getData Func tetikleniyor.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if  searchText.count >= 2 {
            let replaceSearchText =  searchText.replacingOccurrences(of: " ", with: "+").addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)! //türkçe karakterlen temizlendi.s
            searchAPI = URL(string: "\(APIURL)&term=\(replaceSearchText)")!
            
            WebService.instance.getData(url: searchAPI , filter: entity) { (results) in
                self.resultArray =    results
                print(self.resultArray)
            }
            if self.resultArray.count > 0 {
            self.collectionView.reloadData()
            }else{
                print(searchAPI)
            }
        }
        
            
    }
    
    //collectionViewPart
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // print(self.resultArray.count)
        return self.resultArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as! ItemCollectionViewCell
        //cell.configure(with: UIImage(named: "bart")
        print(self.resultArray[indexPath.row].artworkUrl100)
        let url = URL(string: self.resultArray[indexPath.row].artworkUrl100)
        if let data = try? Data(contentsOf: url!){
            DispatchQueue.main.async {
                cell.configure(with: UIImage(data: data)! )

            }
        }
     return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
    
  // horizontal filter opitons with segmented control
    
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl){
        
        if sender.selectedSegmentIndex == 0 {
            entity = "track"
        } else if sender.selectedSegmentIndex == 1 {
            entity = "movie"
        }else if sender.selectedSegmentIndex == 2 {
            entity = "software"
        }else if sender.selectedSegmentIndex == 3 {
            entity = "ebook"
        }
        resultArray.removeAll(keepingCapacity: false)
        
        WebService.instance.getData(url: searchAPI , filter: entity) { (results) in
            self.resultArray =  results
            if self.resultArray.count > 0 {
            self.collectionView.reloadData()
            }
        }
 
        
    }
    
    
    //Details VC'e gitmemizi sağlayan Segue. Collection Viewde bir grid'e basılırsa details VC'e aktarılıyor.
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destinationVC = segue.destination as! DetailVC
            destinationVC.result = selectedResult
        }
    }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        selectedResult = resultArray[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)

    }
    
    

    
    
    
    
}


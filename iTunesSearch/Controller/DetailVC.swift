//
//  DetailVC.swift
//  iTunesSearch
//
//  Created by Bengisu Karakılınç on 7.01.2021.
//

//Seçilen Grid'in detay bilgilerini içeren controller

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var result : ItunesSearchResults!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        releaseLabel.text = result.releaseDate
       // priceLabel.text  = String(result.collectionPrice)
        nameLabel.text = result.collectionName
        
     //   let url = URL(string: result.artworkUrl100)
     //   if let data = try? Data(contentsOf: url!){
       //         imageView.image =  UIImage(data: data)!
       // }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

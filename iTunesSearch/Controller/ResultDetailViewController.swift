//
//  DetailVC.swift
//  iTunesSearch
//
//  Created by Bengisu Karakılınç on 7.01.2021.
//

import UIKit

class ResultDetailViewController: UIViewController {

    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var selectedItem: AlbumModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadDetailInfo()
        // Do any additional setup after loading the view.
    }
    
    func loadDetailInfo(){
        guard let item = self.selectedItem else { return }
        self.nameLabel.text = "Name: " + (item.collectionName ?? "")
        self.priceLabel.text = "Price: " + String(describing: item.collectionPrice ?? 0)
        self.releaseLabel.text = "Release Date: " + (item.releaseDate ?? "")
        let url = URL(string: String(describing: item.artworkUrl60 ?? "" ))
        if let data = try? Data(contentsOf: url!){
            self.imageView.image =  UIImage(data: data)!
        }
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

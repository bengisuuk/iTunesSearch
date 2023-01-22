//
//  ItemCollectionViewCell.swift
//  iTunesSearch
//
//  Created by Bengisu Karakılınç on 7.01.2021.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView : UIImageView!
    
    static let identifier = "ItemCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(with image : UIImage){
        imageView.image  = image
    }

    static func nib() -> UINib {
        return UINib(nibName: "ItemCollectionViewCell", bundle: nil )
    }
}

//
//  CollectionViewCell.swift
//  collectionView
//
//  Created by Baidetskyi Jurii on 09.10.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var uiImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        uiImageView.layer.cornerRadius = 20
    }
}

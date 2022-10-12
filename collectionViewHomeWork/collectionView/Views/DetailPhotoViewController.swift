//
//  DetailPhotoViewController.swift
//  collectionView
//
//  Created by Baidetskyi Jurii on 09.10.2022.
//

import UIKit

class DetailPhotoViewController: UIViewController {
    //MARK: url
    var url: String?
    //MARK: detailImageView
    @IBOutlet weak var detailImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.layer.cornerRadius = 30
        loadData(url: url ?? "")
    }
    //MARK:  private func
    private func loadData (url: String) {
        detailImageView.downloaded(from: URL(string: url)!)
    }
}

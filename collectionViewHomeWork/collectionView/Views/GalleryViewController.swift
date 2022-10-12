//
//  ViewController.swift
//  collectionView
//
//  Created by Baidetskyi Jurii on 09.10.2022.
//

import UIKit

class GalleryViewController: UIViewController {
    
    //MARK: loadData
    var urlsArray = [
        "https://drscdn.500px.org/photo/160690901/m=900/58feb61dda8a8bebd2088db97a68b759",
        "https://drscdn.500px.org/photo/160690901/m=900/58feb61dda8a8bebd2088db97a68b759",
        "https://drscdn.500px.org/photo/160690901/m=900/58feb61dda8a8bebd2088db97a68b759",
        "https://drscdn.500px.org/photo/160690901/m=900/58feb61dda8a8bebd2088db97a68b759",
        "https://drscdn.500px.org/photo/160690901/m=900/58feb61dda8a8bebd2088db97a68b759",
        "https://drscdn.500px.org/photo/160690901/m=900/58feb61dda8a8bebd2088db97a68b759",
        "https://drscdn.500px.org/photo/160690901/m=900/58feb61dda8a8bebd2088db97a68b759"
    ]
    
    //MARK: cellReuseIdentifier
    private var cellReuseIdentifier = "CollectionViewCell"
    //MARK: collectionView
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setCustomCells()
    }
    //MARK:  private func
    private func setCollectionView () {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setCustomCells () {
        collectionView.register(UINib(nibName: cellReuseIdentifier,
                                      bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
    }
}
     //MARK:  UICollectionViewDelegate
extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailPhotoViewController") as? DetailPhotoViewController else {
            return
        }
        let url = urlsArray[indexPath.row]
        
        vc.url = url
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
      //MARK:  UICollectionViewDataSource
extension GalleryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        urlsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        let url = urlsArray[indexPath.row]
        cell.uiImageView.downloaded(from: URL(string: url)!)
        cell.uiImageView.contentMode = .scaleAspectFill
        return cell
    }
}
    //MARK:  UICollectionViewDelegateFlowLayout
extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 340)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10)
    }
}

//
//  UserController.swift
//  Vkontakte App
//
//  Created by Dmitry Andreyanov on 8/9/19.
//  Copyright © 2019 Dmitrii Andreianov. All rights reserved.
//
//

import UIKit

class UserController: UICollectionViewController {
    
    @IBOutlet var fotosView: UICollectionView!
    var photos = [UIImage]()
    
    
    //MARK: - UICollectionViewDataSource methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! UserCell
        cell.photoView.image = photos[indexPath.item]
        
        return cell
    }
}


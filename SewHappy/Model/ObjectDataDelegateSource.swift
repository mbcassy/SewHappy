//
//  ObjectDataDelegateSource.swift
//  SewHappy
//
//  Created by Cassy on 3/6/21.
//

import UIKit

class ObjectDataDelegateSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    //TODO: edit this with real data
    var data: [Int] = Array(0..<10)
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //TODO: Edit this with the amount of items in your fabric stash
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FabricCell.identifier, for: indexPath) as! FabricCell
             
        //TODO: Edit this for actual data
        let data = self.data[indexPath.item]
        cell.textLabel.text = String(data)
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 16
        let spacing:CGFloat = 16

        let totalSpacing = (2 * spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        let collection = collectionView
        let width = (collection.bounds.width - totalSpacing) / numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let spacing:CGFloat = 16
        return UIEdgeInsets(top: spacing,left: spacing, bottom: spacing,right: spacing)
    }
}

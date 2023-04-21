//
//  CollectionViewController.swift
//  godReder
//
//  Created by Борух Соколов on 18.04.2023.
//

import UIKit

private let reuseIdentifier = "photoCell"

class CollectionViewController: UICollectionViewController {

    
    let itemsPerRow: CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    var nameImahe=[
                     "dog1.png",
                     "dog2.png",
                     "dog3.png",
                     "dog4.png",
                     "dog5.png",
                     "dog6.png",
                     "dog7.png",
                     "dog8.png",
                     "dog9.png",
                     "dog10.png",
                     "dog11.png",
                     "dog12.png",
                     "dog13.png",
                     "dog14.png",
                     "dog15.png"
     
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return nameImahe.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        cell.backgroundColor = .black
        cell.imageGall.image=UIImage(named: nameImahe[indexPath.row])
        
        
        // Configure the cell
    
        return cell
    }

    
    
}

//расставляем обекты используя код
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    //устанавливаем размер элементов
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //отступы от границ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    
    //рассьояние между обектами по линиям
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
    //рассьояние между обектами по рядам
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
    
    
    //обработка события перехода
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="photoVC"{
            
            //наша ячейка
            let cell=sender as! CollectionViewCell
            
            //там в файле
            let photoVC=segue.destination as! ViewControllerAbout
            photoVC.image=cell.imageGall.image
            
        }
    }
    
    
    
}

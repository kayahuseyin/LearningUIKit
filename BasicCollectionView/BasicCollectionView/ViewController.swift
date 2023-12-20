//
//  ViewController.swift
//  BasicCollectionView
//
//  Created by Hüseyin Kaya on 12.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    var countries:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let design: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let width = self.collectionView.frame.size.width
        
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        design.itemSize = CGSize(width: (width-30)/3, height: (width-30)/3)
        
        design.minimumInteritemSpacing = 5
        
        design.minimumLineSpacing = 5
        
        collectionView!.collectionViewLayout = design
        
        countries = [
            "Türkiye", "Germany", "France", "Korea", "Sweden", "Japan", "Albania", "Montenegro",
            "Italy", "Spain", "Canada", "Australia", "Brazil", "China", "Egypt", "India", "Mexico",
            "Nigeria", "Russia", "South Africa", "United Kingdom", "United States", "Argentina",
            "Indonesia", "Pakistan", "Bangladesh", "Philippines", "Vietnam", "Ethiopia"
        ]
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1 // Sutun sayisi
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count // Item sayisi
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { // Kac item varsa sirayla gosterilecek
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell //downcasting
        
        cell.countryLabel.text = countries[indexPath.item]
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { // Item tiklandiginda calisir
        print("Secilen Ulke: \(countries[indexPath.item])")
        
    }
    
}


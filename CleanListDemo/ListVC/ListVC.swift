//
//  ListVC.swift
//  CleanListDemo
//
//  Created by Sharad Goyal on 03/11/17.
//  Copyright © 2017 Sharad Goyal. All rights reserved.
//

import UIKit
import AlamofireImage

class ListVC: BaseVC, UICollectionViewDataSource, UICollectionViewDelegate {

 let cellSize: CGSize = CGSize(width: UIScreen.main.bounds.size.width - 20, height: 100)
    
    @IBOutlet weak var collectionViewItems: UICollectionView!
    var interacter: ListInteracter!
    var listItems: [Item]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        intializeConfigurator()
        getListOfItems()
        
        // Do any additional setup after loading the view.
    }
    
    private func intializeConfigurator() {
        let configurator = ListConfigurator.shared
        configurator.configure(vc: self)
    }
    
    private func getListOfItems() {
        Utile.showIndicator()
        interacter.fetchItems()
    }
    
    func showList(response: MostWatchedItems) {
        Utile.hideIndicator()
        
        listItems = response.getMostWatchedItemsResponse?.itemRecommendations?.item
        
        collectionViewItems.register(UINib.init(nibName: "ListCell", bundle: Bundle.main), forCellWithReuseIdentifier: "listCell")
        
        if let flowLayout = collectionViewItems.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        
        collectionViewItems.dataSource = self
        collectionViewItems.delegate = self
        
        print("Response to show on VC...")
    }
    
    override func retryBtnClickedOnErrorView() {
        removeErrorView()
        Utile.showIndicator()
        interacter.fetchItems()
    }
    
    //MARK: - UICollectionView Delegate / Datasource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return listItems?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCell", for: indexPath) as! ListCell
        
        let item: Item? = listItems?[indexPath.row]
        cell.labelTitle.text = item?.itemId ?? ""
        cell.labelSubTitle.text = item?.title ?? ""
        
        cell.tag = indexPath.row
        
        if let url = URL(string: item?.imageURL ?? "") {
            
            DispatchQueue.global().async {
                let image = UIImage.init(data: try! Data.init(contentsOf: url))
                DispatchQueue.main.async {
                    if cell.tag == indexPath.row {
                        cell.imgView.image = image
                    }
                }
            }
            
            
//            cell.imgView.af_setImage(withURL: url, completion: { (response) in
//                if response.result.value != nil {
//                    cell.imgView.contentMode = .scaleAspectFit
//                }
//            })
        }
        
        setShaddowOn(view: cell)
        
        return cell
    }

}

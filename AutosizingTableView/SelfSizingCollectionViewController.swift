//
//  SelfSizingCollectionViewController.swift
//  AutosizingTableView
//
//  Created by muukii on 6/1/17.
//  Copyright © 2017 muukii. All rights reserved.
//

import UIKit

final class SelfSizingCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  @IBOutlet private weak var collectionView: UICollectionView!
  
  private lazy var models: [Model] = Model.models
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
    
    let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return models.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
    let model = models[indexPath.item]
    cell.set(model: model)
    cell.maxWidth = collectionView.bounds.width
    return cell
  }
}

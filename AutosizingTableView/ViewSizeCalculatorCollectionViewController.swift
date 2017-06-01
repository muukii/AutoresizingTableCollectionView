//
//  ViewSizeCalculatorCollectionViewController.swift
//  AutosizingTableView
//
//  Created by muukii on 6/1/17.
//  Copyright © 2017 muukii. All rights reserved.
//

import UIKit

import ViewSizeCalculator

final class ViewSizeCalculatorCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  @IBOutlet private weak var collectionView: UICollectionView!
  
  private lazy var models: [Model] = Model.models
  
  private lazy var cal: ViewSizeCalculator<CollectionViewCell> = ViewSizeCalculator<CollectionViewCell>(sourceView: CollectionViewCell(frame: .zero))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
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
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return cal.calculate(width: collectionView.bounds.width, height: nil, cacheKey: nil) { (cell) in
      let model = models[indexPath.item]
      cell.set(model: model)
    }
  }
}

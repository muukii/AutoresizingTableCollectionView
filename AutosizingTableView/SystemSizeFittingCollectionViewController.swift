//
//  SystemSizeFittingCollectionView.swift
//  AutosizingTableView
//
//  Created by muukii on 6/6/17.
//  Copyright © 2017 muukii. All rights reserved.
//

import UIKit

final class SystemSizeFittingCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  private lazy var models: [Model] = Model.models
  
  private lazy var sizingCell = CollectionViewCell(frame: .zero)
  
  private let collectionView: UICollectionView = {
    
    let layout = UICollectionViewFlowLayout()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    
    collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
    
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(collectionView)
    
    collectionView.frame = view.bounds
    collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    collectionView.delegate = self
    collectionView.dataSource = self
    
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
    
    let model = models[indexPath.item]
    
    sizingCell.set(model: model)
    
    let targetSize = CGSize(
      width: collectionView.bounds.width,
      height: UILayoutFittingCompressedSize.height
    )
    
    let size = sizingCell.contentView.systemLayoutSizeFitting(
      targetSize,
      withHorizontalFittingPriority: UILayoutPriorityRequired,
      verticalFittingPriority: UILayoutPriorityFittingSizeLevel
    )
    
    return size
    
  }
}

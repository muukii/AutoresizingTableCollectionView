//
//  CollectionViewCell.swift
//  AutosizingTableView
//
//  Created by muukii on 6/1/17.
//  Copyright © 2017 muukii. All rights reserved.
//

import UIKit
import EasyPeasy

final class CollectionViewCell: UICollectionViewCell {
  
  private let bodyView = BodyView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    contentView.addSubview(bodyView)
    
    bodyView <- Edges()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  var maxWidth: CGFloat?
  
  func set(model: Model) {
    bodyView.set(model: model)
  }
  
  override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
   
    guard let width = maxWidth else {
      return super.preferredLayoutAttributesFitting(layoutAttributes)
    }
    
    let targetSize = CGSize(width: width, height: UILayoutFittingCompressedSize.height)
    
    let size = contentView.systemLayoutSizeFitting(
      targetSize, withHorizontalFittingPriority: .required,
      verticalFittingPriority: .fittingSizeLevel
    )
    
    layoutAttributes.frame.size = size
    
    return layoutAttributes
  }
  
}

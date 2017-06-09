//
//  Cell.swift
//  AutosizingTableView
//
//  Created by muukii on 6/1/17.
//  Copyright © 2017 muukii. All rights reserved.
//

import UIKit

import EasyPeasy

final class TableViewCell: UITableViewCell {
  
  private let bodyView = BodyView()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.addSubview(bodyView)
    
    bodyView <- Edges()
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func set(model: Model) {
    bodyView.set(model: model)
  }
  
}

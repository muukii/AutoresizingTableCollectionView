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
  
  private let __titleLabel = UILabel()
  private let __valueLabel = UILabel()
  private let __button = UIButton(type: .system)
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    __titleLabel.numberOfLines = 1
    __valueLabel.numberOfLines = 0
    
    contentView.addSubview(__titleLabel)
    contentView.addSubview(__valueLabel)
    contentView.addSubview(__button)
    
    __titleLabel.font = UIFont.systemFont(ofSize: 12)
    __valueLabel.font = UIFont.systemFont(ofSize: 14)
    __button.setTitle("Badge", for: .normal)
    
    __titleLabel.setContentCompressionResistancePriority(900, for: .horizontal)
    __button.setContentCompressionResistancePriority(900, for: .horizontal)
    
    __titleLabel <- [
      Left(16),
      Top(16),
      Bottom(<=16),
    ]
    
    __button <- [
      Center(),
      Left(8).to(__titleLabel, .right)
    ]
    
    __valueLabel <- [
      Top(16),
      Right(16),
      Bottom(16),
      Left(8).to(__button, .right),
    ]
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func set(model: Model) {
    __titleLabel.text = model.title
    __valueLabel.text = model.body
  }
  
}

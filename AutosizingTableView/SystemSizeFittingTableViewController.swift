//
//  SystemSizeFittingTableViewController.swift
//  AutosizingTableView
//
//  Created by muukii on 6/6/17.
//  Copyright © 2017 muukii. All rights reserved.
//

import UIKit

final class SystemSizeFittingTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  private lazy var models: [Model] = Model.models
  
  private lazy var sizingCell: TableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
  
  private lazy var tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(tableView)
    
    tableView.frame = view.bounds
    tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    tableView.delegate = self
    tableView.dataSource = self
    
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
    
    let model = models[indexPath.row]
    cell.set(model: model)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    let model = models[indexPath.item]
    
    sizingCell.set(model: model)
    
    let targetSize = CGSize(
      width: tableView.bounds.width,
      height: UILayoutFittingCompressedSize.height
    )
    
    let size = sizingCell.contentView.systemLayoutSizeFitting(
      targetSize,
      withHorizontalFittingPriority: .required,
      verticalFittingPriority: .fittingSizeLevel
    )
    
    return size.height
  }
}

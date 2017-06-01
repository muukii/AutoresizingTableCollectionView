//
//  AutomaticDimensionViewControllerr.swift
//  AutosizingTableView
//
//  Created by muukii on 6/1/17.
//  Copyright © 2017 muukii. All rights reserved.
//

import UIKit

import ViewSizeCalculator
import EasyPeasy

class SelfSizingTableViewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet private weak var tableView: UITableView!
  
  private let models: [Model] = Model.models
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.estimatedRowHeight = 100
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
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
}

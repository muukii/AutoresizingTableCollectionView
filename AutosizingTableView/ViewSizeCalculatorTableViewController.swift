//
//  ViewController.swift
//  AutosizingTableView
//
//  Created by muukii on 6/1/17.
//  Copyright © 2017 muukii. All rights reserved.
//

import UIKit

import ViewSizeCalculator
import EasyPeasy

class ViewSizeCalculatorTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet private weak var tableView: UITableView!
  
  private let models: [Model] = Model.models
  
  private lazy var cal: ViewSizeCalculator<TableViewCell> = {
    let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
    return ViewSizeCalculator.init(sourceView: cell)
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
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
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    let size = cal.calculate(width: tableView.bounds.width, height: nil, cacheKey: nil) { (cell) in
      let model = models[indexPath.row]
      cell.set(model: model)
    }
    
    return size.height
  }
}

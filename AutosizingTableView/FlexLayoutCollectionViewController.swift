//
//  FlexLayoutCollectionViewController.swift
//  AutosizingTableView
//
//  Created by muukii on 11/12/17.
//  Copyright © 2017 muukii. All rights reserved.
//

import UIKit

import FlexLayout

final class FlexLayoutCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  @IBOutlet private weak var collectionView: UICollectionView!

  private let calculateCell: CollectionViewCell = .init(frame: .zero)

  private lazy var models: [Model] = Model.models

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

    let model = models[indexPath.item]
    calculateCell.set(model: model)

    let size = calculateCell.sizeThatFits(CGSize(width: collectionView.bounds.width, height: .greatestFiniteMagnitude))
    return size
  }
}

extension FlexLayoutCollectionViewController {

  final class CollectionViewCell: UICollectionViewCell {

    private let titleLabel = UILabel()
    private let valueLabel = UILabel()
    private let button = UIButton(type: .system)

    override init(frame: CGRect) {
      super.init(frame: frame)

      contentView
        .flex
        .direction(.row)
        .padding(16)
        .define { flex in

          flex.alignItems(.start)

          flex.addItem(titleLabel)
          flex.addItem(button)
          flex.addItem(valueLabel)

          titleLabel.flex.shrink(1)
          valueLabel.flex.shrink(1)

          titleLabel.numberOfLines = 0
          valueLabel.numberOfLines = 0
      }
    }

    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    func set(model: Model) {

      titleLabel.text = model.title
      titleLabel.flex.markDirty()

      valueLabel.text = model.body
      valueLabel.flex.markDirty()

      setNeedsLayout()
    }

    override func layoutSubviews() {
      super.layoutSubviews()
      contentView.flex.maxWidth(contentView.bounds.width)
      layout()
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
      contentView.flex.maxWidth(size.width)
      layout()
      return contentView.frame.size
    }

    private func layout() {
      contentView.flex.layout(mode: .adjustHeight)
    }
  }
}

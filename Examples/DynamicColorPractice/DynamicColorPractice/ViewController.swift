//
//  ViewController.swift
//  DynamicColorPractice
//
//  Created by dave76 on 20/06/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit
import DynamicColor

//class ViewController: UIViewController {
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    // Do any additional setup after loading the view.
//  }
//
//
//}

final class ColorCellView: UICollectionViewCell {
  @IBOutlet weak var colorView: UIView?
  @IBOutlet weak var titleLabel: UILabel!
  
  func layoutColorView() {
    if let cv = colorView {
      cv.layer.cornerRadius = cv.bounds.width / 2
    }
  }
}

class HeaderView: UICollectionReusableView {
  @IBOutlet weak var titleLabel: UILabel!
  
}

class ViewController: UIViewController {
  private let colorCellIdentifier = "ColorCell"
  
  @IBOutlet weak var colorCollectionView: UICollectionView!
  
  private lazy var colors: [(String, UIColor)] = {
    let mainColor = UIColor(hexString: "#c0392b")
    
    return [
      ("Original", mainColor),
      ("Lighter", mainColor.lighter()),
      ("Darkered", mainColor.darkened()),
      ("Saturated", mainColor.saturated()),
      ("Desaturated", mainColor.desaturated()),
      ("Grayscaled", mainColor.grayscaled()),
      ("Adjusted", mainColor.adjustedHue(amount: 45)),
      ("Complemented", mainColor.complemented()),
      ("Inverted", mainColor.inverted()),
      ("Mix Blue", mainColor.mixed(withColor: .blue)),
      ("Mix Green", mainColor.mixed(withColor: .green)),
      ("Mix Yellow", mainColor.mixed(withColor: .yellow)),
      ("Tinted", mainColor.tinted()),
      ("Shaded", mainColor.shaded())
    ]
  }()
  
  private lazy var gradients: [(String, UIColor)] = {
    return [UIColor(hex: 0x3498db), UIColor(hex: 0xe74c3c), UIColor(hex: 0xf1c40f)].gradient.colorPalette(amount: 15).map { ($0.toHexString(), $0) }
  }()
  
  func collection(inSection section: Int) -> [(String, UIColor)] {
    return section == 0 ? colors : gradients
  }
}

extension ViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return collection(inSection: section).count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: colorCellIdentifier, for: indexPath)
    
    self.collectionView(collectionView, willDisplay: cell, forItemAt: indexPath)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    // swiftlint:disable force_cast
    let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
    supplementaryView.titleLabel.text = indexPath.section == 0 ? "Colors" : "Gradients"
    
    return supplementaryView
  }
}


extension ViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    guard let cell = cell as? ColorCellView else { return }
    
    let (title, color) = collection(inSection: indexPath.section)[indexPath.row]
    
    cell.titleLabel?.text           = title
    cell.colorView?.backgroundColor = color
    
    cell.layoutColorView()
  }
}

//
//  ViewController.swift
//  TextureASViewControllerTest
//
//  Created by minhoi_goo on 08/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: ASViewController<ASCollectionNode>, MosaicCollectionViewLayoutDelegate, ASCollectionDataSource, ASCollectionDelegate {
  
  var _sections = [[UIImage]]()
  let _collectionNode: ASCollectionNode
  let _layoutInspector = MosaicCollectionViewLayoutInspector()
  let kNumberOfImages: UInt = 14
  
  init() {
    let layout = MosaicCollectionViewLayout()
    layout.numberOfColumns = 3;
    layout.headerHeight = 44;
    _collectionNode = ASCollectionNode(frame: CGRect.zero, collectionViewLayout: layout)
    super.init(node: _collectionNode)
    layout.delegate = self
    
    _sections.append([]);
    var section = 0
    for idx in 0 ..< kNumberOfImages {
      let name = String(format: "image_%d.jpg", idx)
      _sections[section].append(UIImage(named: name)!)
      if ((idx + 1) % 5 == 0 && idx < kNumberOfImages - 1) {
        section += 1
        _sections.append([])
      }
    }
    
    _collectionNode.backgroundColor = UIColor.white
    _collectionNode.dataSource = self
    _collectionNode.delegate = self
    _collectionNode.layoutInspector = _layoutInspector
    _collectionNode.registerSupplementaryNode(ofKind: UICollectionView.elementKindSectionHeader)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    _collectionNode.view.isScrollEnabled = true
  }
  
  func collectionNode(_ collectionNode: ASCollectionNode, nodeForItemAt indexPath: IndexPath) -> ASCellNode {
    let image = _sections[indexPath.section][indexPath.item]
    return ImageCellNode(with: image)
  }
  
  
  func collectionNode(_ collectionNode: ASCollectionNode, nodeForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> ASCellNode {
    let textAttributes : NSDictionary = [
      convertFromNSAttributedStringKey(NSAttributedString.Key.font): UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline),
      convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): UIColor.gray
    ]
    let textInsets = UIEdgeInsets(top: 11, left: 0, bottom: 11, right: 0)
    let textCellNode = ASTextCellNode(attributes: textAttributes as! [AnyHashable : Any], insets: textInsets)
    textCellNode.text = String(format: "Section %zd", indexPath.section + 1)
    return textCellNode
  }
  
  
  func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
    return _sections.count
  }
  
  func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
    return _sections[section].count
  }
  
  internal func collectionView(_ collectionView: UICollectionView, layout: MosaicCollectionViewLayout, originalItemSizeAtIndexPath: IndexPath) -> CGSize {
    return _sections[originalItemSizeAtIndexPath.section][originalItemSizeAtIndexPath.item].size
  }
}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
  return input.rawValue
}

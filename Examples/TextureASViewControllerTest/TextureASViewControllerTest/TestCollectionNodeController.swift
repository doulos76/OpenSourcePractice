//
//  TestCollectionNodeController.swift
//  TextureASViewControllerTest
//
//  Created by minhoi_goo on 08/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class TestCollectionNodeFlowLayout: UICollectionViewFlowLayout {
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    let attributes = super.layoutAttributesForElements(in: rect)
    var leftMargin = sectionInset.left
    var maxY: CGFloat = -1.0
    attributes?.forEach { layoutAttribute in
      if layoutAttribute.frame.origin.y >= maxY {
        leftMargin = sectionInset.left
      }
      layoutAttribute.frame.origin.x = leftMargin
      
      leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
      maxY = max(layoutAttribute.frame.maxY, maxY)
    }
    return attributes
  }
}

class TestCollectionNodeController: ASViewController<ASCollectionNode> {
  var items = ["AAA", "BBB", "CCC", "DDD"]
  var cellNodes: [TextureCollectionCellNode] {
    var result = [TextureCollectionCellNode]()
    return result
  }
  init() {
    super.init(node: ASCollectionNode.init(collectionViewLayout: TestCollectionNodeFlowLayout.init()))
    node.backgroundColor = .yellow
    node.dataSource = self
    node.delegate = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension TestCollectionNodeController: ASCollectionDelegate, ASCollectionDataSource {
  func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  func collectionNode(_ collectionNode: ASCollectionNode, nodeForItemAt indexPath: IndexPath) -> ASCellNode {
    let node = cellNodes[indexPath.row]
    return node
  }
}

//class TestCollectionNodeController: ASViewController<ASTableNode> {
//
//  var items = ["AAA", "BBB", "CCC", "DDD"]
//
//  init() {
//    super.init(node: ASTableNode.init(style: .plain))
//    node.backgroundColor = .white
//    node.delegate = self
//    node.dataSource = self
//  }
//
//  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//}
//
//extension TestCollectionNodeController: ASTableDelegate, ASTableDataSource {
//  func numberOfSections(in tableNode: ASTableNode) -> Int {
//    return 1
//  }
//
//  func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
//    return items.count
//  }
//
//  func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
//    return {
//      let item = self.items[indexPath.row]
//      return TextureCollectionCellNode(item: item)
//    }
//  }
//}

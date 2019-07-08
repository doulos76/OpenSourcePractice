//
//  TestNodeController.swift
//  TextureQuickTableExample
//
//  Created by minhoi_goo on 08/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class TestNodeController: ASViewController<ASTableNode> {
  
  var items: [String] = ["Welcome to Texture-KR",
                         "Welcome to Texture-KR",
                         "Welcome to Texture-KR, long test!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"]
  
  init() {
    super.init(node: ASTableNode.init(style: .plain))
    self.node.backgroundColor = .white
    self.node.delegate = self
    self.node.dataSource = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension TestNodeController: ASTableDelegate, ASTableDataSource {
  
  func numberOfSections(in tableNode: ASTableNode) -> Int {
    return 1
  }
  
  func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
    return {
      let item = self.items[indexPath.row]
      return TestCellNode(item: item)
    }
  }
}

//
//  TestNodeController.swift
//  TextureQuickExample
//
//  Created by minhoi_goo on 08/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class TestNodeController: ASViewController<TestNode> {
  
  init() {
    super.init(node: TestNode.init())
    self.node.backgroundColor = .white
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

//class TestNodeController: ASViewController<ASDisplayNode> {
//
//  let imageNode: ASImageNode = {
//    let node = ASImageNode()
//    node.image = UIImage(named: "image")
//    node.borderColor = UIColor.gray.cgColor
//    node.borderWidth = 1.0
//    node.cornerRadius = 15.0
//    node.contentMode = .scaleAspectFit
//    return node
//  }()
//
//  let titleNode: ASTextNode = {
//    let node = ASTextNode()
//    let paragraphStyle = NSMutableParagraphStyle()
//    paragraphStyle.alignment = .center
//    node.attributedText =
//      NSAttributedString(string: "Welcome to Texture-KR",
//                         attributes: [.font: UIFont.boldSystemFont(ofSize: 15.0),
//                                      .foregroundColor: UIColor.gray,
//                                      .paragraphStyle: paragraphStyle])
//    return node
//  }()
//
//  init() {
//    super.init(node: ASDisplayNode.init())
//    self.node.backgroundColor = .white
//    self.node.automaticallyManagesSubnodes = true
//    self.node.automaticallyRelayoutOnSafeAreaChanges = true
//    self.node.layoutSpecBlock = { [weak self] (node, constraintedSize) -> ASLayoutSpec in
//      return self?.layoutSpecThatFits(constraintedSize) ?? ASLayoutSpec()
//    }
//  }
//
//  private func layoutSpecThatFits(_ constraintedSize: ASSizeRange) -> ASLayoutSpec {
//    let imageRatioLayout = ASRatioLayoutSpec(ratio: 1.0, child: imageNode)
//    imageRatioLayout.style.flexShrink = 1.0
//    let containerLayout = ASStackLayoutSpec(direction: .vertical,
//                                            spacing: 10.0,
//                                            justifyContent: .center,
//                                            alignItems: .center,
//                                            children: [imageRatioLayout, titleNode])
//
//    var containerInsets: UIEdgeInsets = self.node.safeAreaInsets
//    containerInsets.left += 15.0
//    containerInsets.right += 15.0
//    containerInsets.top = containerInsets.bottom
//    return ASInsetLayoutSpec(insets: containerInsets, child: containerLayout)
//  }
//
//  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//}

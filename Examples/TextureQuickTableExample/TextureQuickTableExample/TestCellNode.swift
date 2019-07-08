//
//  TestCellNode.swift
//  TextureQuickTableExample
//
//  Created by minhoi_goo on 08/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class TestCellNode: ASCellNode {
  
  let imageNode: ASImageNode = {
    let node = ASImageNode()
    node.image = UIImage(named: "image")
    node.borderColor = UIColor.gray.cgColor
    node.borderWidth = 1.0
    node.cornerRadius = 15.0
    node.contentMode = .scaleAspectFit
    return node
  }()
  
  let titleNode: ASTextNode = {
    let node = ASTextNode()
    node.maximumNumberOfLines = 1
    return node
  }()
  
  init(item: String) {
    super.init()
    self.automaticallyManagesSubnodes = true
    self.selectionStyle = .none
    self.backgroundColor = .white
    self.titleNode.attributedText =
      NSAttributedString(string: item,
                         attributes: [.font: UIFont.boldSystemFont(ofSize: 15.0),
                                      .foregroundColor: UIColor.gray])
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let imageRatioLayout = ASRatioLayoutSpec(ratio: 1.0, child: imageNode)
    imageRatioLayout.style.flexBasis =  ASDimension(unit: .fraction, value: 0.3)
    titleNode.style.flexBasis =  ASDimension(unit: .fraction, value: 0.7)
    
    let containerLayout = ASStackLayoutSpec(direction: .horizontal,
                                            spacing: 10.0,
                                            justifyContent: .start,
                                            alignItems: .stretch,
                                            children: [imageRatioLayout, titleNode])
    
    var containerInsets: UIEdgeInsets = .zero
    containerInsets.left = 15.0
    containerInsets.right = 15.0
    containerInsets.top = 15.0
    containerInsets.bottom = 15.0
    return ASInsetLayoutSpec(insets: containerInsets, child: containerLayout)
  }
}

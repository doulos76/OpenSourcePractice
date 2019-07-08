//
//  TestNode.swift
//  TextureASViewControllerTest
//
//  Created by minhoi_goo on 08/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class TestNode: ASDisplayNode {
  
  let imageNode: ASImageNode = {
    let node = ASImageNode()
    node.image = UIImage(named: "image")
    node.borderColor = UIColor.red.cgColor
    node.borderWidth = 1.0
    node.cornerRadius = 10.0
    node.contentMode = .scaleAspectFit
    node.backgroundColor = .white
    return node
  }()
  
  let titleNode: ASTextNode = {
    let node = ASTextNode()
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .center
    node.attributedText = NSAttributedString(string: "Welcome to Texture-KR",
                                             attributes: [.font: UIFont.boldSystemFont(ofSize: 15),
                                                          .foregroundColor: UIColor.gray,
                                                          .paragraphStyle: paragraphStyle])
    return node
  }()
  
  override init() {
    super.init()
    backgroundColor = .white
    automaticallyManagesSubnodes = true
    automaticallyRelayoutOnSafeAreaChanges = true
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let imageRatioLayout = ASRatioLayoutSpec(ratio: 1, child: imageNode)
    imageRatioLayout.style.flexShrink = 1.0
    let containerLayout = ASStackLayoutSpec(direction: .vertical,
                                            spacing: 10.0,
                                            justifyContent: .center,
                                            alignItems: .center,
                                            children: [imageRatioLayout, titleNode])
    
    var containerInsets: UIEdgeInsets = self.safeAreaInsets
    containerInsets.left += 15.0
    containerInsets.right += 15
    containerInsets.top = containerInsets.bottom
    
    return ASInsetLayoutSpec(insets: containerInsets, child: containerLayout)
  }
}

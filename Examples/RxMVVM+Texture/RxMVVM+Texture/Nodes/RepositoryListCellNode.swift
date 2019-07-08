//
//  RepositoryListCellNode.swift
//  RxMVVM+Texture
//
//  Created by minhoi_goo on 08/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import Foundation
import AsyncDisplayKit
import RxSwift
import RxCocoa
import RxCocoa_Texture

class RepositoryListCellNode: ASCellNode {
  typealias Node = RepositoryListCellNode
  
  struct Attribute {
    static let placeHolderColor: UIColor = UIColor.gray.withAlphaComponent(0.2)
  }
  
  // nodes
  lazy var userProfileNode = { () -> ASNetworkImageNode in
    let node = ASNetworkImageNode()
    node.style.preferredSize = CGSize(width: 50.0, height: 50.0)
    node.cornerRadius = 25.0
    node.clipsToBounds = true
    node.placeholderColor = Attribute.placeHolderColor
    node.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
    node.borderWidth = 0.5
    return node
  }()
  
  lazy var usernameNode = { () -> ASTextNode in
    let node = ASTextNode()
    node.maximumNumberOfLines = 1
    node.placeholderColor = Attribute.placeHolderColor
    return node
  }()
  
  lazy var descriptionNode = { () -> ASTextNode in
    let node = ASTextNode()
    node.placeholderColor = Attribute.placeHolderColor
    node.maximumNumberOfLines = 2
    node.truncationAttributedText = NSAttributedString(string: "...More", attributes: Node.moreSeeAttributes)
    node.delegate = self
    node.isUserInteractionEnabled = true
    return node
  }()
  
  lazy var statusNode = { () -> ASTextNode in
    let node = ASTextNode()
    node.placeholderColor = Attribute.placeHolderColor
    return node
  }()
  
  let disposeBag = DisposeBag()
  
  let id: Int
  
  init(viewModel: RepositoryViewModel) {
    self.id = viewModel.id
    super.init()
    self.selectionStyle = .none
    self.backgroundColor = .white
    self.automaticallyManagesSubnodes = true
    
    viewModel.profileURL
      .bind(to: userProfileNode.rx.url, setNeedsLayout: self)
      .disposed(by: disposeBag)
    
    viewModel.username
      .bind(to: usernameNode.rx.text(Node.usernameAttributes), setNeedsLayout: self)
      .disposed(by: disposeBag)
    
    viewModel.desc
      .bind(to: descriptionNode.rx.text(Node.descAttributes), setNeedsLayout: self)
      .disposed(by: disposeBag)
    
    viewModel.status
      .bind(to: statusNode.rx.text(Node.statusAttributes), setNeedsLayout: self)
      .disposed(by: disposeBag)
    
    userProfileNode.rx
    .tap(to: viewModel.openProfileRelay)
    .disposed(by: disposeBag)
  }
}

extension RepositoryListCellNode {
  // layout spec
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let contentLayout = contentLayoutSpec()
    contentLayout.style.flexShrink = 1.0
    contentLayout.style.flexGrow = 1.0
    
    userProfileNode.style.flexShrink = 1.0
    userProfileNode.style.flexGrow = 0.0
    
    let stackLayout = ASStackLayoutSpec(direction: .horizontal,
                                        spacing: 10.0,
                                        justifyContent: .start,
                                        alignItems: .center,
                                        children: [userProfileNode, contentLayout])
    let insets = UIEdgeInsets.init(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    return ASInsetLayoutSpec(insets: insets, child: stackLayout)
  }
  
  private func contentLayoutSpec() -> ASLayoutSpec {
    let element = [self.usernameNode,
                   self.descriptionNode,
                   self.statusNode].filter { $0.attributedText?.length ?? 0 > 0 }
    return ASStackLayoutSpec(direction: .vertical,
                             spacing: 5.0,
                             justifyContent: .start,
                             alignItems: .stretch,
                             children: element)
  }
}

extension RepositoryListCellNode: ASTextNodeDelegate {
  func textNodeTappedTruncationToken(_ textNode: ASTextNode!) {
    textNode.maximumNumberOfLines = 0
    self.setNeedsLayout()
  }
}

extension RepositoryListCellNode {
  static var usernameAttributes: [NSAttributedString.Key: Any] {
    return [.foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 20.0)]
  }
  
  static var descAttributes: [NSAttributedString.Key: Any] {
    return [.foregroundColor: UIColor.darkGray,
            .font: UIFont.systemFont(ofSize: 15.0)]
  }
  
  static var statusAttributes: [NSAttributedString.Key: Any] {
    return [.foregroundColor: UIColor.gray,
            .font: UIFont.systemFont(ofSize: 12.0)]
  }
  
  static var moreSeeAttributes: [NSAttributedString.Key: Any] {
    return [.foregroundColor: UIColor.darkGray,
            .font: UIFont.systemFont(ofSize: 15.0, weight: .medium)]
  }
}

//
//  FirstNode.swift
//  TexturePractice
//
//  Created by 정의석 on 2020/11/28.
//

import UIKit
import RxSwift
import RxCocoa
import RxViewController
import RxOptional

import AsyncDisplayKit
import ReactorKit

import PINRemoteImage
import SwiftRichString
import Then

class FirstNode: ASDisplayNode, View {
  typealias Reactor = FirstReactor
  
  var disposeBag: DisposeBag = DisposeBag()
  
  struct Const {
    static let imagePreviewColor: UIColor = .lightGray
  }
  
  lazy var titleNode: ASTextNode = ASTextNode().then {
    $0.backgroundColor = .orange
  }
  
  lazy var messageNode: ASTextNode = ASTextNode().then {
    $0.backgroundColor = .magenta
  }
  
  lazy var previewImageNode: ASNetworkImageNode = ASNetworkImageNode().then {
    $0.backgroundColor = Const.imagePreviewColor
    $0.cornerRoundingType = .defaultSlowCALayer
    $0.cornerRadius = 39
  }
  
  lazy var subTitleNode: ASTextNode = ASTextNode()
  
  override init() {
    super.init()
    self.reactor = FirstReactor()
    self.automaticallyManagesSubnodes = true
  }
  
  override func didLoad() {
    super.didLoad()
  }
  
  func bind(reactor: Reactor) {
    reactor.action.onNext(.initAction) // AttributedString Init
    
    reactor.state.asObservable()
      .map { $0.titleAttrStr }
      .bind { [weak self] in
        self?.titleNode.attributedText = $0
      }
      .disposed(by: disposeBag)
    
    reactor.state.asObservable()
      .map { $0.messageAttrStr }
      .bind { [weak self] in
        self?.messageNode.attributedText = $0
      }
      .disposed(by: disposeBag)
    
    reactor.state.asObservable()
      .map { $0.profileImageURL }
      .bind { [weak self] in
        self?.previewImageNode.url = $0
      }
      .disposed(by: disposeBag)
  }
}

extension FirstNode {
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let cell = self.looklikeCellLayoutSpec(constrainedSize)
    // NOTE: define flexBox attribute
    cell.style.nonShrink().grow(0.0)
    
    return ASStackLayoutSpec(direction: .vertical,
                             spacing: 0.0,
                             justifyContent: .center,
                             alignItems: .start,
                             children: [cell])
  }
  
  private func looklikeCellLayoutSpec(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let previewImageLayout = self.previewImageLayoutSpec(constrainedSize)
    let titleAndMessageLayout = self.titleAndMessageLayoutSpec(constrainedSize)
    
    previewImageLayout.style.shrink(0.0).grow(0.0)
    titleAndMessageLayout.style.shrink(1.0).nonGrow()
    
    let cellLayout = ASStackLayoutSpec(direction: .horizontal, spacing: 10, justifyContent: .start, alignItems: .start, children: [previewImageLayout, titleAndMessageLayout])
    return ASInsetLayoutSpec(insets: .init(top: 5, left: 5, bottom: 5, right: 5), child: cellLayout)
  }
  
  private func previewImageLayoutSpec(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let ratioLayout = ASRatioLayoutSpec(ratio: 1.0, child: previewImageNode)
    ratioLayout.style.width = .init(unit: .points, value: 78)
    return ASInsetLayoutSpec(insets: .init(top: 5, left: 5, bottom: 5, right: 5), child: ratioLayout)
  }
  
  private func titleAndMessageLayoutSpec(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    titleNode.style.shrink(1.0).nonGrow()
    messageNode.style.shrink(1.0).grow(1.0)
    let layout = ASStackLayoutSpec(direction: .vertical,
                                   spacing: 5.0,
                                   justifyContent: .start,
                                   alignItems: .start,
                                   children: [titleNode, messageNode])
    return ASInsetLayoutSpec(insets: .init(top: 10, left: 0, bottom: 0, right: 0), child: layout)
  }
}




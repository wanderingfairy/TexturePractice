//
//  CellNode.swift
//  TexturePractice
//
//  Created by xlab on 2020/11/30.
//

import UIKit
import RxSwift
import RxCocoa
import RxViewController
import RxOptional
import RxDataSources
import RxDataSources_Texture

import AsyncDisplayKit
import ReactorKit

import PINRemoteImage
import SwiftRichString
import Then

class CellNode: ASCellNode {
    
    lazy var userNameLabel = ASTextNode()
    lazy var messageTextNode = ASTextNode()
    lazy var profileImageNode = ASNetworkImageNode().then {
        $0.cornerRoundingType = .defaultSlowCALayer
        $0.cornerRadius = 39
    }
    
    init(message: MessageModel) {
        super.init()
        automaticallyManagesSubnodes = true
        userNameLabel.attributedText = message.attributedStringForUserName(withSize: 18)
        messageTextNode.attributedText = message.attributedStringForMessageText(withSize: 16)
        profileImageNode.url = message.profileImageURL
    }
}

extension CellNode {
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let cell = self.cellLayoutSpec(constrainedSize)
        cell.style.shrink(1.0).grow(1.0)
        return ASInsetLayoutSpec(insets: .init(top: 0, left: 0, bottom: 0, right: 0),
                                 child: cell)
    }
    
    private func cellLayoutSpec(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
      let profileImageLayout = self.profileImageLayoutSpec(constrainedSize)
      let userNameWithMessageLayout = self.titleAndMessageLayoutSpec(constrainedSize)
      
        profileImageLayout.style.shrink(0.0).grow(0.0)
        userNameWithMessageLayout.style.shrink(1.0).nonGrow()
      
      let cellLayout = ASStackLayoutSpec(direction: .horizontal,
                                         spacing: 10,
                                         justifyContent: .start,
                                         alignItems: .center,
                                         children: [profileImageLayout, userNameWithMessageLayout])
      return ASInsetLayoutSpec(insets: .init(top: 5, left: 5, bottom: 5, right: 5), child: cellLayout)
    }
    
    
    private func profileImageLayoutSpec(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
      let ratioLayout = ASRatioLayoutSpec(ratio: 1.0, child: profileImageNode)
      ratioLayout.style.width = .init(unit: .points, value: 78)
      return ASInsetLayoutSpec(insets: .init(top: 5, left: 5, bottom: 5, right: 5),
                               child: ratioLayout)
    }
    
    private func titleAndMessageLayoutSpec(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        userNameLabel.style.shrink(1.0).nonGrow()
        messageTextNode.style.shrink(1.0).grow(1.0)
      let layout = ASStackLayoutSpec(direction: .vertical,
                                     spacing: 5.0,
                                     justifyContent: .start,
                                     alignItems: .start,
                                     children: [userNameLabel, messageTextNode])
      return ASInsetLayoutSpec(insets: .init(top: 10, left: 0, bottom: 0, right: 0),
                               child: layout)
    }
}


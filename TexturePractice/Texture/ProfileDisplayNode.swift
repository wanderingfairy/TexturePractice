//
//  ProfileDisplayNode.swift
//  xlab-iOS
//
//  Created by xlab on 2020/12/22.
//  Copyright © 2020 xlab. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxViewController
import RxOptional
import RxTexture2
import RxDataSources
import RxDataSources_Texture

import AsyncDisplayKit
import ReactorKit

import PINRemoteImage
import SwiftRichString
import Then


class ProfileDisplayNode: ASDisplayNode, View {
    typealias Reactor = ProfileDisplayNodeReactor

    var disposeBag: DisposeBag = DisposeBag()
    
    lazy var headerNode = ProfileHeaderNode()
    
    override init() {
        super.init()
        self.reactor = ProfileDisplayNodeReactor(provider: ServiceProvider())
        self.automaticallyManagesSubnodes = true
        self.automaticallyRelayoutOnSafeAreaChanges = true
    }
    
    func bind(reactor: ProfileDisplayNodeReactor) {
        
    }
    
    override func didLoad() {
        super.didLoad()
    }
    
}

extension ProfileDisplayNode {
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: .init(top: self.safeAreaInsets.top, left: 0, bottom: 0, right: 0), child: headerNode)
    }
}

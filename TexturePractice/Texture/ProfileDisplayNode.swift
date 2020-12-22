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
    
    lazy var pagerNode: ASPagerNode = {
        let node = ASPagerNode()
        node.backgroundColor = .blue
        return node
    }()
    
    override init() {
        super.init()
        self.reactor = ProfileDisplayNodeReactor(provider: ServiceProvider())
        self.automaticallyManagesSubnodes = true
        self.automaticallyRelayoutOnSafeAreaChanges = true
        pagerNode.setDelegate(self)
        pagerNode.setDataSource(self)
    }
    
    func bind(reactor: ProfileDisplayNodeReactor) {
        
    }
    
    override func didLoad() {
        super.didLoad()
    }
    
}

extension ProfileDisplayNode: ASPagerDelegate, ASPagerDataSource {
    func numberOfPages(in pagerNode: ASPagerNode) -> Int {
        2
    }
    func pagerNode(_ pagerNode: ASPagerNode, nodeBlockAt index: Int) -> ASCellNodeBlock {
        // TODO: - 셀노드 대신 DisplayNode 반환시켜서 만드는 법 찾기.
        let node = ASCellNode( { () -> ASDisplayNode in
            switch index {
            case 0:
                return ProfileAlbumNode()
            default:
                return ProfileItemNode()
            }
        }, didLoadBlock: nil)
        
        return node
    }
}

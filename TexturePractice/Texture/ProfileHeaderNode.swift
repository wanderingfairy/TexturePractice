//
//  ProfileHeaderNode.swift
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

class ProfileHeaderNode: ASDisplayNode, View {
    typealias Reactor = ProfileHeaderNodeReactor

    var disposeBag: DisposeBag = DisposeBag()
    
    override init() {
        super.init()
        self.reactor = ProfileHeaderNodeReactor(provider: ServiceProvider())
        self.automaticallyManagesSubnodes = true
        self.automaticallyRelayoutOnSafeAreaChanges = true
    }
    
    func bind(reactor: ProfileHeaderNodeReactor) {
        
    }
    
    override func didLoad() {
        super.didLoad()
        self.view.backgroundColor = .orange
    }
    
}

//
//  ProfilePagerNode.swift
//  TexturePractice
//
//  Created by xlab on 2020/12/22.
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


class ProfilePagerNode: ASPagerNode, View {
    
    typealias Reactor = ProfilePagerNodeReactor

    var disposeBag: DisposeBag = DisposeBag()
    
    override init() {
        super.init()
        self.reactor = ProfilePagerNodeReactor(provider: ServiceProvider())
        self.automaticallyManagesSubnodes = true
        self.automaticallyRelayoutOnSafeAreaChanges = true
    }
    
    func bind(reactor: ProfilePagerNodeReactor) {
        
    }
    
    override func didLoad() {
        super.didLoad()
    }
}

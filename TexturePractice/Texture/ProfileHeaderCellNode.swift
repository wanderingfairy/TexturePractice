//
//  ProfileHeaderCellNode.swift
//  TexturePractice
//
//  Created by xlab on 2020/12/23.
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
import SkeletonView

class ProfileHeaderCellNode: ASCellNode, View {
    typealias Reactor = ProfileHeaderNodeReactor
    
    var disposeBag: DisposeBag
    
    override init() {
        self.disposeBag = DisposeBag()
        super.init()
        self.reactor = ProfileHeaderNodeReactor(provider: ServiceProvider())
        automaticallyManagesSubnodes = true
    }
    
    func bind(reactor: ProfileHeaderNodeReactor) {
        
    }
    
    override func didLoad() {
        super.didLoad()
    }
}

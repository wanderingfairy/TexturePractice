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
    
    func bind(reactor: ProfileHeaderNodeReactor) {
        
    }
    
}

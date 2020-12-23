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
import SkeletonView

class ProfileHeaderNode: ASDisplayNode, View {
    typealias Reactor = ProfileHeaderNodeReactor
    
    var disposeBag: DisposeBag = DisposeBag()
    
    fileprivate struct Attributes {
        static var amountTextStyle = Style {
            $0.font = Font(name: "Spoqa-Han-Sans-Bold", size: 18)
            //            $0.font = UIFont(name: "Spoqa-Han-Sans-Bold", size: 18)
            $0.color = UIColor.black
            $0.alignment = .center
        }
        static var titleTextStyle = Style {
            $0.font = UIFont(name: "NotoSansCJKkr-DemiLight", size: 12)
            $0.color = UIColor.brownGrey
            $0.alignment = .center
        }
        static var editProfileTextStyle = Style {
            $0.font = UIFont(name: "NotoSansCJKkr-Medium", size: 12)
            $0.color = UIColor.greyishBrown
            $0.alignment = .center
        }
        static var userNameTextStyle = Style {
            $0.font = Font(name: "NotoSansCJKkr-Bold", size: 24)
            //            $0.font = SystemFonts.Helvetica_Light.font(size: 24)
            $0.color = UIColor.black
            $0.alignment = .center
        }
    }
    
    // NavigationBar Button items
    lazy var backButtonNode: ASButtonNode = ASButtonNode().then {
        $0.setImage(UIImage(named: "arrowBackBlack"), for: .normal)
    }
    lazy var postingButtonNode = ASButtonNode().then {
        $0.setImage(UIImage(named: "uploadBlack"), for: .normal)
    }
    lazy var bookmarkButtonNode = ASButtonNode().then {
        $0.setImage(UIImage(named: "saveBlack"), for: .normal)
    }
    lazy var shoppingbasketButtonNode = ASButtonNode().then {
        $0.setImage(UIImage(named: "myshopBlack"), for: .normal)
    }
    lazy var settingButtonNode = ASButtonNode().then {
        $0.setImage(UIImage(named: "settingBlack"), for: .normal)
    }
    
    // User information Nodes
    lazy var followerAmountTextNode = ASTextNode().then {
        $0.attributedText = "0".set(style: Attributes.amountTextStyle)
    }
    lazy var followerTextNode = ASTextNode().then {
        $0.attributedText = "팔로워".set(style: Attributes.titleTextStyle)
    }
    
    lazy var followingAmountTextNode = ASTextNode().then {
        $0.attributedText = "0".set(style: Attributes.amountTextStyle)
    }
    lazy var followingTextNode = ASTextNode().then {
        $0.attributedText = "팔로잉".set(style: Attributes.titleTextStyle)
    }
    
    lazy var editProfileButtonNode = ASButtonNode().then {
        $0.setAttributedTitle("프로필 수정".set(style: Attributes.editProfileTextStyle), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.veryLightPinkTwo.cgColor
    }
    lazy var userNameTextNode = ASTextNode().then {
        $0.attributedText = "Name".set(style: Attributes.userNameTextStyle)
    }
    lazy var userProfileImageNode = ASImageNode().then {
        $0.style.preferredSize = CGSize(width: 100, height: 100)
        $0.cornerRadius = 50
        $0.clipsToBounds = true
        $0.view.isSkeletonable = true
        $0.view.showAnimatedSkeleton()
    }
    
    // pet collectionNode in headerNode.
    lazy var petCollectionNode = ASCollectionNode(collectionViewLayout: UICollectionViewLayout())
    //gray Bar
    lazy var grayBottomBar = ASDisplayNode()
    
    
    //Segmented Control
    lazy var albumButtonNode = ASButtonNode()
    lazy var itemButtonNode = ASButtonNode()
    lazy var selectedBlackBarNode = ASDisplayNode()
    
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
        self.view.backgroundColor = .white
    }
    
}

extension ProfileHeaderNode {
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let naviBarLayout = navigationBarLayoutSpec(constrainedSize)
        naviBarLayout.style.nonGrow().nonShrink()
        let userProfileLayout = userProfileLayoutSpec(constrainedSize)
        userProfileLayout.style.nonGrow().nonShrink()
        
        let headerViewLayout = ASStackLayoutSpec(direction: .vertical,
                                                 spacing: 0,
                                                 justifyContent: .start,
                                                 alignItems: .stretch,
                                                 children: [naviBarLayout, userProfileLayout])
        return headerViewLayout
    }
    
    private func navigationBarLayoutSpec(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        [backButtonNode,
         postingButtonNode,
         bookmarkButtonNode,
         shoppingbasketButtonNode,
         settingButtonNode]
            .forEach {
                $0.style.nonGrow().nonShrink()
                $0.style.width = ASDimension(unit: .points, value: 44)
                $0.style.height = backButtonNode.style.width
            }
        
        let naviBarLeftContainer = ASStackLayoutSpec(direction: .horizontal,
                                                     spacing: 0,
                                                     justifyContent: .start,
                                                     alignItems: .center,
                                                     children: [backButtonNode])
        let naviBarRightContainer = ASStackLayoutSpec(direction: .horizontal,
                                                      spacing: 0,
                                                      justifyContent: .spaceBetween,
                                                      alignItems: .center,
                                                      children: [postingButtonNode,
                                                                 bookmarkButtonNode,
                                                                 shoppingbasketButtonNode,
                                                                 settingButtonNode])
        
        naviBarLeftContainer.style.flexBasis = ASDimension(unit: .fraction, value: 0.5)
        naviBarRightContainer.style.flexBasis = ASDimension(unit: .fraction, value: 0.5)
        
        let naviBarContainer = ASStackLayoutSpec(direction: .horizontal,
                                                 spacing: 0,
                                                 justifyContent: .spaceBetween,
                                                 alignItems: .center,
                                                 children: [naviBarLeftContainer,
                                                            naviBarRightContainer])
        
        return naviBarContainer
    }
    
    private func userProfileLayoutSpec(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        [followerAmountTextNode, followingAmountTextNode, followerTextNode, followingTextNode].forEach {
            $0.style.nonGrow().nonShrink()
        }
        editProfileButtonNode.style.width = ASDimension(unit: .points, value: 76)
        editProfileButtonNode.style.height = ASDimension(unit: .points, value: 32)
        
        userProfileImageNode.style.width = ASDimension(unit: .points, value: 100)
        userProfileImageNode.style.width = ASDimension(unit: .points, value: 100)
        
        let followerVStack = ASStackLayoutSpec(direction: .vertical,
                                               spacing: 5,
                                               justifyContent: .center,
                                               alignItems: .center,
                                               children: [followerAmountTextNode, followerTextNode])
        
        let followingVStack = ASStackLayoutSpec(direction: .vertical,
                                                spacing: 5,
                                                justifyContent: .center,
                                                alignItems: .center,
                                                children: [followingAmountTextNode, followingTextNode])
        
        let editProfileFollowerFollowingHStack = ASStackLayoutSpec(direction: .horizontal,
                                                                   spacing: 20,
                                                                   justifyContent: .start,
                                                                   alignItems: .center,
                                                                   children: [editProfileButtonNode, followerVStack, followingVStack])
        
        let userNameEditProfileFollowerFollowingVStack = ASStackLayoutSpec(direction: .vertical,
                                                                           spacing: 17,
                                                                           justifyContent: .start,
                                                                           alignItems: .start,
                                                                           children: [userNameTextNode,
                                                                                      editProfileFollowerFollowingHStack])
        
        let userProfileHStack = ASStackLayoutSpec(direction: .horizontal,
                                                  spacing: 20,
                                                  justifyContent: .start,
                                                  alignItems: .start,
                                                  children: [userProfileImageNode,
                                                             userNameEditProfileFollowerFollowingVStack])
        
        return ASInsetLayoutSpec(insets: .init(top: 32, left: 20, bottom: 0, right: 0),
                                 child: userProfileHStack)
    }
}

extension UIColor {
    @nonobjc class var greyishBrown: UIColor {
        return UIColor(white: 74.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var veryLightPinkTwo: UIColor {
      return UIColor(white: 209.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var brownGrey: UIColor {
      return UIColor(white: 164.0 / 255.0, alpha: 1.0)
    }
}

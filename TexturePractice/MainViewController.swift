//
//  ViewController.swift
//  TexturePractice
//
//  Created by 정의석 on 2020/11/28.
//

import UIKit
import Then
import AsyncDisplayKit
import RxSwift
import RxCocoa

class MainViewController: ASDKViewController<ASDisplayNode> {
  
  override init() {
    let firstNode = FirstNode()
    super.init(node: firstNode)
    self.navigationItem.title = "Main"
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}


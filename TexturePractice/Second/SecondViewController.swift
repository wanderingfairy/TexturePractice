//
//  TableNode.swift
//  TexturePractice
//
//  Created by xlab on 2020/11/30.
//

import UIKit
import Then
import AsyncDisplayKit
import RxSwift
import RxCocoa
import RxDataSources
import RxDataSources_Texture
import ReactorKit

class SecondViewController: ASDKViewController<ASDisplayNode>{
  
  override init() {
    super.init(node: SecondNode())
    self.navigationItem.title = "Second"
    self.node.automaticallyManagesSubnodes = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

//
//  ProfileASDKViewController.swift
//  xlab-iOS
//
//  Created by xlab on 2020/12/22.
//  Copyright © 2020 xlab. All rights reserved.
//

import UIKit
import Then
import AsyncDisplayKit
import RxSwift
import RxCocoa
import RxDataSources
import RxDataSources_Texture
import ReactorKit

class ProfileASDKViewController: ASDKViewController<ASDisplayNode>{
    

    
    override init() {
        super.init(node: ProfileDisplayNode())
        self.node.backgroundColor = .white
        self.node.automaticallyManagesSubnodes = true
        node.automaticallyRelayoutOnSafeAreaChanges = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

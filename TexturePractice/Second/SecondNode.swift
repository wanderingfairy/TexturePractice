//
//  SecondNode.swift
//  TexturePractice
//
//  Created by xlab on 2020/11/30.
//

import UIKit
import RxSwift
import RxCocoa
import RxViewController
import RxOptional
import RxDataSources
import RxDataSources_Texture

import AsyncDisplayKit
import ReactorKit

import PINRemoteImage
import SwiftRichString
import Then


class SecondNode: ASDisplayNode, View, ASTableDataSource, ASTableDelegate {
    typealias Reactor = SecondReactor
    
    let messages = BehaviorRelay<[MessageModel]?>(value: nil)
    let since = BehaviorRelay<Int?>(value: nil)
    let sections: Observable<[MessageSection]> 
    
    let animatedDataSource = RxASTableSectionedAnimatedDataSource<MessageSection> { (dataSource, tableNode, indexPath, message) -> ASCellNodeBlock in
        switch message {
        case .message(let messageItem):
            return { CellNode(message: messageItem) }
        }
    }
    private let dataSource = RxASTableSectionedReloadDataSource<MessageSection>  { (dataSource, tableNode, indexPath, message) -> ASCellNodeBlock in
        switch message {
        case .message(let messageItem):
            return { CellNode(message: messageItem) }
        }
    }
    
    var disposeBag: DisposeBag = DisposeBag()
    
    var batchContext: ASBatchContext?
    
    lazy var tableNode = ASTableNode().then {
        $0.backgroundColor = .cyan
        $0.automaticallyManagesSubnodes = true
//        $0.delegate = self
//        $0.dataSource = self
    }
    
    override init() {
        print("Node init()")
        self.messages.accept(dummyMessages)
        
        self.sections = self.messages
            .filterNil()
            .map { [MessageSection.message(messages: $0.map { MessageSectionItem.message($0)})] }
            .asObservable()
        
        self.messages.map { $0?.last?.id }
            .filterNil()
            .bind(to: since)
            .disposed(by: disposeBag)
        
        super.init()
        self.reactor = SecondReactor()
        self.automaticallyManagesSubnodes = true
        
        
    }
    
    override func didLoad() {
        view.backgroundColor = .cyan
        print("Node didLoad()")
    }
    
    func bind(reactor: Reactor) {
        print("Node bind()")
        tableNode.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        self.sections
//            .do(onNext: { [weak self] _ in
//                self?.batchContext?.completeBatchFetching(true)
//            })
            .bind(to: tableNode.rx.items(dataSource: animatedDataSource))
            .disposed(by: disposeBag)
        
        self.tableNode.rx.willBeginBatchFetch
            .asObservable()
            .subscribe(onNext: { [weak self] context in
                self?.batchContext = context
                self?.batchContext?.completeBatchFetching(true)
            })
            .disposed(by: disposeBag)
            
    }
}

extension SecondNode {
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        print("Node layoutSpecThatFits()")
        let display = self.tableNodeLayoutSpec(constrainedSize)
        return display
    }
    
    private func tableNodeLayoutSpec(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let tableNodeLayout = ASInsetLayoutSpec(insets: .init(top: 0, left: 0, bottom: 0, right: 0), child: tableNode)
        return tableNodeLayout
    }
}

extension SecondNode {
//    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
//        return dummyMessages.count
//    }
//
//    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
//        let messageModel = dummyMessages[indexPath.row]
//        let nodeBlock: ASCellNodeBlock = {
//            let cell = CellNode(message: messageModel)
////            cell.style.height = ASDimension(unit: .points, value: 44) // cell height setting
//            return cell
//        }
//        return nodeBlock
//    }
    
    func shouldBatchFetch(for tableNode: ASTableNode) -> Bool {
        print("Node shouldBatchFetch()")
        return true
    }
    
//    func tableNode(_ tableNode: ASTableNode, willBeginBatchFetchWith context: ASBatchContext) {
// 스크롤할 때 미리 데이터 받아오는 게 필요하다면 사용.
    //
//    }
}

let node = SecondNode()
let output = node.layoutSpecThatFits(ASSizeRangeZero).asciiArtString()

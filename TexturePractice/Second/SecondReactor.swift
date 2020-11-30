//
//  SecondReactor.swift
//  TexturePractice
//
//  Created by xlab on 2020/11/30.
//

import Foundation
import ReactorKit
import RxSwift
import RxCocoa
import SwiftRichString

class SecondReactor: Reactor {
    enum Action {
        
    }
    
    enum Mutation {
        
    }
    
    struct State {
        var model: [MessageModel]?
        var titleText: String = "Messages"
    }
    
    var initialState: State = State()
    var disposedBag = DisposeBag()
    
    func mutate(action: Action) -> Observable<Mutation> {
        return .empty()
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        return state
    }
}


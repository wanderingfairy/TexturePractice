//
//  ProfileItemNodeReactor.swift
//  xlab-iOS
//
//  Created by xlab on 2020/12/22.
//  Copyright © 2020 xlab. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift
import RxCocoa

class ProfileItemNodeReactor: Reactor {
    enum Action { }
    enum Mutation { }
    struct State { }
    
    init(provider: ServiceProviderType) {
        self.provider = provider
    }
    
    var initialState: State = State()
    var disposedBag: DisposeBag = DisposeBag()
    var provider: ServiceProviderType
    
    func mutate(action: Action) -> Observable<Mutation> {
        return .empty()
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        return state
    }
}

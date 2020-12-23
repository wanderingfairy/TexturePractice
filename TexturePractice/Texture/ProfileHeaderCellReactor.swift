//
//  ProfileHeaderCellReactor.swift
//  TexturePractice
//
//  Created by xlab on 2020/12/23.
//

import Foundation
import ReactorKit
import RxSwift
import RxCocoa

class ProfileHeaderCellReactor: Reactor {
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

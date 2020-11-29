//
//  FirstReactor.swift
//  TexturePractice
//
//  Created by 정의석 on 2020/11/29.
//

import Foundation
import ReactorKit
import RxSwift
import RxCocoa

class FirstReactor: Reactor {
  enum Action {
    
  }
  enum Mutation {
    
  }
  struct State {
    
  }
  
  var initialState: State = State()
  var disposeBag = DisposeBag()
  
  func mutate(action: Action) -> Observable<Mutation> {
    return .empty()
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    return state
  }
}

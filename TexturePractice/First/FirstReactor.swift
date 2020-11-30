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
import SwiftRichString

class FirstReactor: Reactor {
  enum Action {
    case initAction
  }
  enum Mutation {
    case startMutation
  }
  
  struct Const {
    static let titleFontSize: CGFloat = 20
    static let messageFontSize: CGFloat = 16
    static let titleStyle = Style {
      $0.font = SystemFonts.Helvetica.font(size: Const.titleFontSize)
      $0.underline = (.patternDot, UIColor.red)
      $0.alignment = .center
    }
    static let messageStyle = Style {
      $0.font = SystemFonts.Helvetica.font(size: Const.messageFontSize)
      $0.alignment = .center
    }
  }
  
  struct State {
    var titleStr: String
    var messageStr: String
    var titleAttrStr: AttributedString
    var messageAttrStr: AttributedString
    var profileImageURL: URL
    
    init() {
      self.titleStr = "Mr.Golden"
      self.messageStr = "Hi. How are you doing?"
      self.titleAttrStr = "".set(style: Const.titleStyle)
      self.messageAttrStr = "".set(style: Const.messageStyle)
      self.profileImageURL = ImageURL.profileImage.url
    }
  }
  
  var initialState: State = State()
  var disposeBag = DisposeBag()
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .initAction:
      return .just(.startMutation)
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    switch mutation {
    case .startMutation:
      var newState = state
      newState.titleAttrStr = newState.titleStr.set(style: Const.titleStyle)
      newState.messageAttrStr = newState.messageStr.set(style: Const.messageStyle)
      return newState
    }
  }
}

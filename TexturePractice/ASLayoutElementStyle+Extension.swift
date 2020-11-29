//
//  ASLayoutElementStyle+Extension.swift
//  TexturePractice
//
//  Created by 정의석 on 2020/11/30.
//

import Foundation
import AsyncDisplayKit

extension ASLayoutElementStyle {
  /** If the sum of childrens' stack dimensions is grater than the maximum size, should this object shrink
   */
  @discardableResult func shrink(_ scale: CGFloat) -> ASLayoutElementStyle {
    self.flexShrink = scale
    return self
  }
  
  @discardableResult func grow(_ scale: CGFloat) -> ASLayoutElementStyle {
    self.flexGrow = scale
    return self
  }
  
  @discardableResult func nonGrow() -> ASLayoutElementStyle {
    self.flexGrow = 0.0
    return self
  }
  
  @discardableResult func nonShrink() -> ASLayoutElementStyle {
    self.flexShrink = 0.0
    return self
  }
}

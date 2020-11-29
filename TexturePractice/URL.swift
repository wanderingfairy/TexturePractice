//
//  URL.swift
//  TexturePractice
//
//  Created by 정의석 on 2020/11/30.
//

import Foundation


enum ImageURL {
  case profileImage
}

extension ImageURL {
  var url: URL {
    switch self {
    case .profileImage:
      return URL.init(string: "https://avatars3.githubusercontent.com/u/8419048?s=400&u=09cd3006d8b5d283e7849fee6e6ad9f377701847&v=4")!
    }
  }
}

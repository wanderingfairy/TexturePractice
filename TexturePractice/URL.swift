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
      return URL.init(string: "https://avatars3.githubusercontent.com/u/56634480?s=400&u=8c44d783c5eac3d5e87aaed9dacf36ca6cec5c5e&v=4")!
    }
  }
}

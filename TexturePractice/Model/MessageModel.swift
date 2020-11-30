//
//  MessageModel.swift
//  TexturePractice
//
//  Created by xlab on 2020/11/30.
//

import Foundation
import RxDataSources_Texture
import UIKit

enum MessageSection {
    case message(messages: [MessageSectionItem])
}

extension MessageSection: AnimatableSectionModelType {
    
    typealias Identity = String
    
    var identity: String {
        switch self {
        case .message: return "message"
        }
    }
    
    var items: [MessageSectionItem] {
        switch self {
            case .message(let messages): return messages
        }
    }
    
    init(original: MessageSection, items: [MessageSectionItem]) {
        switch original {
        case .message: self = .message(messages: items)
        }
    }
}

enum MessageSectionItem {
    case message(MessageModel)
}

extension MessageSectionItem: IdentifiableType {
    typealias Identity = Int
    
    var identity: Int {
        switch self {
        case .message(let message):
            return message.id
        }
    }
}

extension MessageSectionItem: Equatable {
    static func == (lhs: MessageSectionItem, rhs: MessageSectionItem) -> Bool {
        return lhs.identity == rhs.identity
    }
    
    
}

struct MessageModel {
    var id: Int
    var userName: String
    var messageText: String
    var profileImageURL: URL
}

extension MessageModel {
    func attributedStringForUserName(withSize size: CGFloat) -> NSAttributedString {
        let attributes = [
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: size)
        ]
        return NSAttributedString(string: userName, attributes: attributes)
    }
    
    func attributedStringForMessageText(withSize size: CGFloat) -> NSAttributedString {
        let attributes = [
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: size)
        ]
        return NSAttributedString(string: messageText, attributes: attributes)
    }
}

let dummyMessages: [MessageModel] = [
    MessageModel.init(id: 0, userName: "James", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 1, userName: "Jenny", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 2, userName: "Daniel", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 3, userName: "Sam", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 4, userName: "Nick", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 5, userName: "Martin", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 6, userName: "Smith", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 7, userName: "Belkin", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 8, userName: "Apllo", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 9, userName: "Samsung", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 10, userName: "LG", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 0, userName: "James", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 1, userName: "Jenny", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 2, userName: "Daniel", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 3, userName: "Sam", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 4, userName: "Nick", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 5, userName: "Martin", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 6, userName: "Smith", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 7, userName: "Belkin", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 8, userName: "Apllo", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 9, userName: "Samsung", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 10, userName: "LG", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 0, userName: "James", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 1, userName: "Jenny", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 2, userName: "Daniel", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 3, userName: "Sam", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 4, userName: "Nick", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 5, userName: "Martin", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 6, userName: "Smith", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 7, userName: "Belkin", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 8, userName: "Apllo", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 9, userName: "Samsung", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 10, userName: "LG", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 0, userName: "James", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 1, userName: "Jenny", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 2, userName: "Daniel", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 3, userName: "Sam", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 4, userName: "Nick", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 5, userName: "Martin", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 6, userName: "Smith", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 7, userName: "Belkin", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 8, userName: "Apllo", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 9, userName: "Samsung", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 10, userName: "LG", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 0, userName: "James", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    MessageModel.init(id: 1, userName: "Jenny", messageText: "안녕하세요", profileImageURL: ImageURL.profileImage.url),
    
]

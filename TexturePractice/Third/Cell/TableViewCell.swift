//
//  TableViewCell.swift
//  TexturePractice
//
//  Created by xlab on 2020/11/30.
//

import UIKit
import Then
import SnapKit
import PINRemoteImage

class TableViewCell: UITableViewCell {
    
    static let identifier = "Cell"
    
    lazy var userNameLabel = UILabel()
    lazy var messageText = UILabel()
    lazy var profileImage = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(userNameLabel)
        addSubview(messageText)
        addSubview(profileImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(message: MessageModel) {
        userNameLabel.text = message.userName
        userNameLabel.font = UIFont.systemFont(ofSize: 18)
        messageText.text = message.messageText
        messageText.font = UIFont.systemFont(ofSize: 16)
        profileImage.pin_setImage(from: message.profileImageURL)
        profileImage.layer.cornerRadius = 39
        profileImage.clipsToBounds = true
        setupConstraints()
    }
    
    private func setupConstraints() {
        profileImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(78)
        }
        userNameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImage.snp.trailing).offset(10)
            $0.bottom.equalTo(profileImage.snp.centerY)
        }
        messageText.snp.makeConstraints {
            $0.leading.equalTo(userNameLabel)
            $0.top.equalTo(userNameLabel.snp.bottom).offset(5)
        }
    }

}

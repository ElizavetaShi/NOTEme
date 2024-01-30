//
//  SettingsTableViewCell.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 13.01.24.
//

import UIKit
import SnapKit


final class SettingsTableViewCell: UITableViewCell {
    
    static let identifier: String = "SettingsTableViewCell"
    
    private lazy var containerView: UIView = .mainView(.viewShadow)
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
         label.textColor = .appText
         label.font = .appFont.withSize(12.0)
         return label
     }()
    
    private lazy var statusLabel: UILabel = {
       let label = UILabel()
        label.font = .appFont.withSize(12.0)
        label.textColor = .appLightGrey
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        backgroundColor = .clear
//        selectionStyle = .none
        
        contentView.addSubview(containerView)
        containerView.addSubview(iconImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(statusLabel)
    }
    
    private func setupConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20.0)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().inset(16.0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView.snp.centerY)
            make.left.equalTo(iconImageView.snp.right).offset(8.0)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16.0)
            make.centerY.equalTo(titleLabel.snp.centerY)
        }
    }
    
    func setup(_ type: ProfileSettingsRows) {
        titleLabel.text = type.title
        titleLabel.textColor = type == .logout ? .appRed : .appText
        iconImageView.image = type.icon
        statusLabel.text = type.infoText
    }
}

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
    
    private lazy var notificationsImageView: UIImageView = UIImageView(image: .General.notifications)
    
    private lazy var notificationsButton: UIButton = .settingsButton("Notifications", titleColor: .appText)
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .appLightGrey
        return view
    }()
    
    private lazy var exportImageView: UIImageView = UIImageView(image: .General.export)
    
    private lazy var exportButton: UIButton = .settingsButton("Export", titleColor: .appText)
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
         label.textColor = .appLightGrey
         label.font = .appFont.withSize(12.0)
         label.text = "date"
         return label
     }()
    
    private lazy var separatorView2: UIView = {
        let view = UIView()
        view.backgroundColor = .appLightGrey
        return view
    }()
    
    private lazy var logoutImageView: UIImageView = UIImageView(image: .General.logout)
    
    private lazy var logoutButton: UIButton = .settingsButton("Logout", titleColor: .appRed)
    
    
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
        containerView.addSubview(notificationsImageView)
        containerView.addSubview(notificationsButton)
        containerView.addSubview(separatorView)
        containerView.addSubview(exportImageView)
        containerView.addSubview(exportButton)
        containerView.addSubview(separatorView2)
        containerView.addSubview(logoutImageView)
        containerView.addSubview(logoutButton)
        containerView.addSubview(dateLabel)
    }
    
    private func setupConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20.0)
        }
        
        notificationsImageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().inset(16.0)
        }
        
        notificationsButton.snp.makeConstraints { make in
            make.left.equalTo(notificationsImageView.snp.right).offset(8.0)
            make.centerY.equalTo(notificationsImageView.snp.centerY)
//            make.width.equalTo(279.0)
//            make.height.equalTo(16.0)
        }
        
        separatorView.snp.makeConstraints { make in
            make.height.equalTo(1.0)
            make.top.equalTo(notificationsImageView.snp.bottom).inset(-12.0)
            make.horizontalEdges.equalToSuperview().inset(16.0)
        }
        
        exportImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16.0)
            make.top.equalTo(separatorView.snp.bottom).offset(12.0)
        }
        
        exportButton.snp.makeConstraints { make in
            make.centerY.equalTo(exportImageView.snp.centerY)
            make.left.equalTo(exportImageView.snp.right).offset(8.0)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(exportButton.snp.centerY)
            make.right.equalToSuperview().inset(16.0)
        }
        
        separatorView2.snp.makeConstraints { make in
            make.height.equalTo(1.0)
            make.top.equalTo(exportImageView.snp.bottom).inset(-12.0)
            make.horizontalEdges.equalToSuperview().inset(16.0)
        }
        
        logoutImageView.snp.makeConstraints { make in
            make.top.equalTo(separatorView2.snp.bottom).offset(12.0)
            make.left.equalToSuperview().inset(16.0)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.centerY.equalTo(logoutImageView.snp.centerY)
            make.left.equalTo(logoutImageView.snp.right).offset(8.0)
            make.bottom.equalToSuperview().inset(16.0)
        }
    }
}

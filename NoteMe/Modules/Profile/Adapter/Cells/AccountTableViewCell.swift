//
//  AccountTableViewCell.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 12.01.24.
//

import UIKit
import SnapKit

final class AccountTableViewCell: UITableViewCell {
    
    static let identifier: String = "AccountTableViewCell"
    
    private lazy var containerView: UIView = .mainView(.viewShadow)
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .appMidGrey
        label.font = .appFont.withSize(15.0)
        label.text = "Your e-mail:"
        return label
    }()
    
    private lazy var emailLabel: UILabel = .menuLabel("email", fontSize: 17.0)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ email: String) {
        emailLabel.text = email
    }
    
    private func setupUI() {
        
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(emailLabel)
    }
    
    private func setupConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().inset(16.0)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            make.left.bottom.equalToSuperview().inset(16.0)
        }
    }
}

